
import 'package:alpata_assignment/features/auth/views/login/login_view.dart';
import 'package:alpata_assignment/features/auth/views/splash/splash_view.dart';
import 'package:alpata_assignment/features/stock_market/views/stock_market_home/stock_market_home_view.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashView, initial: true ),
  AutoRoute(page: LoginView),
  AutoRoute(page: StockMarketHomeView)
])
class $AppRouter{

}