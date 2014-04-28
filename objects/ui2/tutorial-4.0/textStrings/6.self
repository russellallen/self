6] Let's modify one of our two bank accounts so that it represents an
account based on shares of stock.
.
Pick one of the account objects and give it two new slots:
    numShares <- 10
and 
    pricePerShare <- 30.
.
Our new account still includes the original "dollars" slot, but the
value in dollars should be computed based on the number of shares and
the price per share. We really want the messages "dollars" and "dollars:
x" to refer to and adjust the number of shares, respectively.
.
Let's change the "dollars" slot - select "edit" from the middle button
menu on this slot and type in
    dollars = (numShares * pricePerShare).
And we want our object to respond to "dollars:" messages as well, so add
a slot
    dollars: x = (numShares: x / pricePerShare).
so that our stock-based account sets the dollar value by adjusting the
number of shares appropriately.
.
Now let's test our new object, and deposit one share's worth of money.
In the object's evaluator send
    deposit: 30.
Within a few seconds you should see you numShares slot update from 10 to
11.
.
Notice that the very same "deposit:" method is now inherited by two
objects, one in which the dollar slot computes a number, and one in
which the dollar slot directly stores a number. Code in Self is unable
to distinguish between stored and computed quantities. This makes it
easy to try out changes in representation without rewriting any
other methods.
.
In the next steps we will see how to make our new objects available from
elsewhere in the system, and how to make a module for saving our objects
to files.
