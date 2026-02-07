Class {
	#name : #TodoItemPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'checkBox',
		'model'
	],
	#category : #TodoList
}

{ #category : #layout }
TodoItemPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: checkBox;
		  yourself
]

{ #category : #initialization }
TodoItemPresenter >> initializePresenters [

	checkBox := self newCheckBox
]

{ #category : #accessing }
TodoItemPresenter >> model [

	^ model
]

{ #category : #accessing }
TodoItemPresenter >> model: aTodoItem [

	model := aTodoItem.
	checkBox
		label: model text;
		state: model checked
]

{ #category : #events }
TodoItemPresenter >> onChangeDo: aBlock [

	checkBox whenChangedDo: [ :state |
		model checked: state.
		aBlock value ]
]
