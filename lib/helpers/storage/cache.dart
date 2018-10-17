import '../../models/api/restaurant.dart';
import '../../models/api/menu_category.dart';
import '../../models/api/user.dart';
import '../../models/api/order.dart';

class Cache {
  static List<Order> currentOrders;
  static User currentUser;
  static Restaurant restaurant;

  static void flush(){
    currentOrders = null;
    currentUser = null;
    restaurant = null;
  }
}