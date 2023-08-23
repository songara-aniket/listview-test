
Issue caution Explanation - 

ListView.builder makes items on demand. That means, they construct item widgets & destroy them when they go beyond more than cacheExtent.

So you cannot keep any ephemeral state inside that item widget. (So most of the time item widgets are Stateless, but when you need to use keepAlive you use Stateful item widgets)

In this case, you have to keep your state in a parent widget. So I think the best option you can use is the State management approach for this.


Solution - 

We use AutomaticKeepAliveClientMixin to keep our item state alive in the Listview Builder. We have different approaches as well to resolve this issue. 
