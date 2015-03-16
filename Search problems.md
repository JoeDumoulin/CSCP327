##Structures for Searching

The **Search Problem** has the structure:

- A set of states.
- An initial state that is the start of the search.
- Actions that can be performed on states of the system.
- A Transition Model: A model that how an action and a state result in a new state.
- A Goal Test:  A way to test to see if a state is the goal state.
- Path Cost:  A way to calculate the cost when transitioning from one state to another.


<br>
The problem constructs a tree of **Nodes** starting at the initial state.  The nodes have the structure:

- State:  The state associated with this node.
- Parent: The parent node of this node.
- Action: The action taken at the parent node to arrive at this node.
- Path-Cost: The accumulated cost from the initial state node to this node.