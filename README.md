# Description

### Behavior
When a user taps on a row, a new table view row with a picker view embedded
inside of it is inserted right below the tapped row. If the user taps that same
row again, the picker view row is removed.

The table view controller has an array of `CellModelType`. Each cell model has a
property `state` of which the table view controller may switch on. The possible
values of `state` are `Open` and `Closed`.

## Tests
This is the first Xcode project in which I wrote unit tests for a table view
controller. I avoided writing tests for view controllers because I simply did
not know how. Use this project as a guide for view controller tests.

