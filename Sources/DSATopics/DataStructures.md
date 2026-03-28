# ``SwiftDSA``

Different data structures and their implementation in Swift.

## Overview

We will first start with linear DSs, before proceeding with non-linear ones. From simple data structure, like array, linkedList, stack, queue etc, we will be going through specialised implementation of each of them.

## Linear Structures

### Monotonic Stack

This is a specialised form of stack which imposes a particular order among the element. By saying that, we mean, there always be a specific and predefined order maintained. So if the mSTack supposed to be in ascending order, one cannot push lesser element in the stack than the last element.

Usage
- Monotonic Stacks comes into play, when the problem involves unidirectional search, filter etc., and  
- The search should have a specific order involved.
eg. Finding next/previous smaller/greater element in the array.
- The catch is operation in this stack will be in O(n), where as if we try with normal array methods it will take O(n^2), as we are going through all the elements repeatedly, whereas mStack makes sure, when next/previous smaller/larger element is found out, things are things are taken care of, so the *push* and *pop* happens at max n times respectively,, making the tc -> O(2n) -> O(n)
