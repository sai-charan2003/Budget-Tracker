import 'dart:async';
import 'dart:math' as math;

import 'package:animations/animations.dart';
import 'package:budget_tracker/Assets/Constants.dart';
import 'package:budget_tracker/Database/database.dart';
import 'package:budget_tracker/Screens/addTransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  
  late StreamSubscription<List<BudgetTrackerItem>> _expenseSubscription;
  late StreamSubscription<List<BudgetTrackerItem>> _incomeSubscription;
  late AppDatabase _db;
  ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isHeaderStuckNotifier = ValueNotifier(false);


  String income = '0.0';
  String expense = '0.0';
  double totalBalance = 0.0;

@override
void initState() {
  super.initState();

  _scrollController = ScrollController()
    ..addListener(() {
      _isHeaderStuckNotifier.value = _scrollController.hasClients &&
          _scrollController.offset >= 200;
    });
}
@override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _db = Provider.of<AppDatabase>(context, listen: false);

    _expenseSubscription = _db.getExpenseMoney().listen((expenses) {
      final totalExpense = _calculateTotalBalance(expenses);
      setState(() {
        expense = totalExpense.toString();
        totalBalance = _calculateTotalBalance(expenses);
      });
    });

    _incomeSubscription = _db.getIncomeMoney().listen((incomes) {
      final totalIncome = _calculateTotalBalance(incomes);
      setState(() {
        income = totalIncome.toString();
        totalBalance = _calculateTotalBalance(incomes);
      });
    });
  }



  @override
  void dispose() {
    _expenseSubscription.cancel();
    _incomeSubscription.cancel();
    super.dispose();
  }
  



  double _calculateTotalBalance(List<BudgetTrackerItem?> items) {
    double total = 0.0;
    for (var item in items) {      
      total += double.parse(item?.money ?? "0");      
    }
    return total;
  }





  @override
Widget build(BuildContext context) { 
  
  return Scaffold(
    floatingActionButtonLocation: ExpandableFab.location,
    floatingActionButton: ExpandableFab(
      distance: 80,    
      fanAngle: 0,    
      type: ExpandableFabType.up,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        heroTag: "fab",
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,  
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(            
        size: 56,
        builder: (BuildContext context, void Function()? onPressed, Animation<double> progress) {
          return AnimatedBuilder(
            animation: progress,
            builder: (context, _) {
              return Transform.rotate(
                angle: progress.value * math.pi / 2,
                child: FloatingActionButton(
                  onPressed: onPressed,
                  child: const Icon(Icons.close),
                ),
              );
            }
          );
        },
      ),
      children: [
        fabChild(
          title: INCOME,        
          icon: Icons.arrow_upward_rounded,
          onClick: () {},
        ),
        fabChild(
          title: EXPENSE, 
          icon: Icons.arrow_downward_rounded,
          onClick: () {},
        ),
      ],
    ),

    body: CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverAppBar.large(
          title: Text('Overview'),
          pinned: true,
        ),
        SliverPersistentHeader(
          delegate: _StickyHeaderDelegate(            
            isHeaderStuckNotifier: _isHeaderStuckNotifier,
            totalBalance: totalBalance.toString(),
            expense: expense,
            income: income
            // isHeaderStuck: _isHeaderStuck,
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
            child: Text('Recent Transactions', style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildList(context),
        ),
      ],
    ),
  );
}

}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate({required this.totalBalance, required this.isHeaderStuckNotifier, required this.income, required this.expense});

  final String totalBalance;
  final String income;
  final String expense;
  final ValueNotifier<bool> isHeaderStuckNotifier;

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 220;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final Typography = Theme.of(context).textTheme;
    return ValueListenableBuilder<bool>(
      valueListenable: isHeaderStuckNotifier,
      builder: (context, isHeaderStuck, child) {
        return SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BalanceDetailsColumnWidget(Typography: Typography, totalBalance: totalBalance, income: income, expense: expense),
          )          
        );
      },
      
    );
  }

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return  oldDelegate.isHeaderStuckNotifier != isHeaderStuckNotifier ||
        oldDelegate.totalBalance != totalBalance ||
        oldDelegate.income != income ||
        oldDelegate.expense != expense;
  }
       
}

class BalanceDetailsRowWidget extends StatelessWidget {
  const BalanceDetailsRowWidget({
    super.key,
    required this.Typography,
    required this.totalBalance,
    required this.income,
    required this.expense,
  });

  final TextTheme Typography;
  final String totalBalance;
  final String income;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
            Text('Total Balance', style: Typography.titleLarge),
            
            Text('₹ $totalBalance', style: Typography.titleLarge),
            
            Row(              
              children: [
                IncomeOrExpenseWidget(totalBalance: income, title: "Income"),
                IncomeOrExpenseWidget(totalBalance: expense, title: "Expense"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BalanceDetailsColumnWidget extends StatelessWidget {
  const BalanceDetailsColumnWidget({
    super.key,
    required this.Typography,
    required this.totalBalance,
    required this.income,
    required this.expense,
    
  });

  final TextTheme Typography;
  final String totalBalance;
  final String income;
  final String expense;
  

  @override
  Widget build(BuildContext context) {  
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Total Balance', style: Typography.titleLarge),
            const SizedBox(height: 20),
            Text('₹ $totalBalance', style: Typography.titleLarge),
            const SizedBox(height: 50),
            Row(              
              children: [
                IncomeOrExpenseWidget(totalBalance: income, title: "Income"),
                const SizedBox(width: 25,),
                IncomeOrExpenseWidget(totalBalance: expense, title: "Expense"),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class fabChild extends StatelessWidget {
  const fabChild({
    super.key,
    required this.title,
    required this.icon,
    required this.onClick
  });

  final String title;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(width: 5),
        OpenContainer(
          closedColor: Theme.of(context).colorScheme.primaryContainer, 
          openColor: Theme.of(context).colorScheme.primaryContainer,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          openShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          transitionDuration: const Duration(milliseconds: 400),          
          openBuilder: (context, _) => AddTransaction(income: title),
          closedBuilder: (context, VoidCallback openContainer) =>
            IconButton(onPressed: openContainer, icon: Icon(icon))
        ),
      ],
    );
  }
}

class IncomeOrExpenseWidget extends StatelessWidget {
  const IncomeOrExpenseWidget({
    super.key,
    required this.totalBalance,
    required this.title,
  });

  final String totalBalance;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(    
      children: <Widget>[
        title == "Income" ? const Icon(Icons.arrow_circle_up, color: Colors.green) : const Icon(Icons.arrow_circle_down, color: Colors.red),
        const SizedBox(width: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title),
            Text('₹ $totalBalance')
          ],
        )
      ],
    );
  }
}

StreamBuilder<List<BudgetTrackerItem>> _buildList(BuildContext context){
  final database = Provider.of<AppDatabase>(context);
  return StreamBuilder(
    stream: database.getAllData(),
    builder: (context, AsyncSnapshot<List<BudgetTrackerItem>> snapshot) {      
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text('No Transactions'));
      } else {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final item = snapshot.data![index];
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.title.toString(), style: Theme.of(context).textTheme.titleMedium),
                      Text(item.money.toString(), style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }
    },
  );
}


