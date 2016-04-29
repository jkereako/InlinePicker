# Description

### Behavior
When a user taps on a row, a new table view row with a picker view embedded
inside of it is inserted right below the tapped row. If the user taps that same
row again, the picker view row is removed.

The table view controller has an array of `CellModelType`. Each cell model has a
property `state` of which the table view controller may switch on. The possible
values of `state` are `Open` and `Closed`.

## Animations
The animations were a pain in the ass. The standard UITableView animation
methods, namely `tableView.insertRowsAtIndexPaths` and
`tableView.deleteRowsAtIndexPaths` don't play nicely with rows of varying size.
This is because, I believe, that `tableView.insertRowsAtIndexPaths` draws the
inserted cell underneath the table view and then animates the top cell down to
reveal the cell underneath. Since the picker cell is 3 times the size of the
subtitle cell, you can see the bottom of the picker cell when inserting. The
only way around this is to set the alpha of the picker cell to 0 and the
background color to `.clearColor()`.

## Tests
This is the first Xcode project in which I wrote unit tests for a table view
controller. I avoided writing tests for view controllers because I simply did
not know how. Use this project as a guide for view controller tests.

