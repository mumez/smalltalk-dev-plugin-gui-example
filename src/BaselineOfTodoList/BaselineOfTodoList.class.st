Class {
	#name : 'BaselineOfTodoList',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTodoList'
}

{ #category : 'baselines' }
BaselineOfTodoList >> baseline: spec [
	<baseline>

	spec for: #common do: [
		"Packages"
		spec
			package: 'TodoList'.

		"Groups"
		spec
			group: 'Core' with: #('TodoList');
			group: 'default' with: #('Core') ]
]
