Class {
	#name : #TodoListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'itemList',
		'inputField',
		'addButton',
		'removeButton',
		'filterField',
		'items'
	],
	#category : #TodoList
}

{ #category : #examples }
TodoListPresenter class >> open [

	<example>
	^ self new open
]

{ #category : #private }
TodoListPresenter >> addItem [

	| text |
	text := inputField text trimBoth.
	text ifEmpty: [ ^ self ].
	items add: (TodoItem text: text).
	inputField text: ''.
	self refreshList
]

{ #category : #layout }
TodoListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: filterField expand: false;
		  add: itemList;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: inputField;
				   add: addButton expand: false;
				   add: removeButton expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
TodoListPresenter >> initializePresenter [

	addButton action: [ self addItem ].
	removeButton action: [ self removeCheckedItems ].
	filterField whenTextChangedDo: [ :text | self refreshList ]
]

{ #category : #initialization }
TodoListPresenter >> initializePresenters [

	items := OrderedCollection new.
	filterField := self newTextInput
		               placeholder: 'Filter items...';
		               yourself.
	itemList := self newComponentList.
	inputField := self newTextInput
		              placeholder: 'Enter new item...';
		              yourself.
	addButton := self newButton
		             label: 'Add';
		             yourself.
	removeButton := self newButton
		                label: 'Remove';
		                yourself
]

{ #category : #initialization }
TodoListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Todo List';
		initialExtent: 400 @ 300
]

{ #category : #private }
TodoListPresenter >> refreshList [

	| filteredItems presenters filterText |
	filterText := (filterField text ifNil: [ '' ]) asLowercase trimBoth.
	filteredItems := filterText
		                 ifEmpty: [ items ]
		                 ifNotEmpty: [
			                 items select: [ :item |
				                 item text asLowercase includesSubstring: filterText ] ].
	presenters := filteredItems collect: [ :item |
		              TodoItemPresenter new
			              model: item;
			              onChangeDo: [ self updateRemoveButton ];
			              yourself ].
	itemList items: presenters.
	removeButton enabled: (items anySatisfy: [ :item | item checked ])
]

{ #category : #private }
TodoListPresenter >> updateRemoveButton [

	removeButton enabled: (items anySatisfy: [ :item | item checked ])
]

{ #category : #private }
TodoListPresenter >> removeCheckedItems [

	items := items reject: [ :item | item checked ].
	self refreshList
]

