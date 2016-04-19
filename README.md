# Description

### Behavior
When a user taps on a row, a new table view row with a picker view embedded inside of it is inserted right below the tapped row. If the user taps that same row again, the picker view row is removed.

The table view controller has an array of `CellModelType`. Each cell model has a property `state` of which the table view controller may switch on. The possible values of `state` are `Open` and `Closed`.
