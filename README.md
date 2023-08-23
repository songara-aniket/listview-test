# Description

- Load ListWidget and run the app.
- Increment first list item by clicking it 3 times. Scroll to bottom and then scroll to top, the
  count will get reset

# Functional/Product Requirement

- There should be 100 list items, each should be set at 0 initially and user can increment its
  count.
- The count incremented by user should be persisted when he scrolls the list.

# Task:

- Solve the functional requirement.
- Review this file from Code Review perspective, list the issues and what changes should be made,
  perform the changes to the file.
- Think of it as a intern checked in this code and as a senior has to code review and fix the code
  from implementation perspective to make it correct and efficient.
- Send the fixed file back to the recruiter.

# Issue Caution -

ListView.builder makes items on demand. That means, they construct item widgets & destroy them when they go beyond more than cacheExtent.

So you cannot keep any ephemeral state inside that item widget. (So most of the time item widgets are Stateless, but when you need to use keepAlive you use Stateful item widgets)

In this case, you have to keep your state in a parent widget. So I think the best option you can use is the State management approach for this.

# Solution -

We use AutomaticKeepAliveClientMixin to keep our item state alive in the Listview Builder. We have different approaches as well to resolve this issue.
