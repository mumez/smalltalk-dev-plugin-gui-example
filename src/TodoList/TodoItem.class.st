Class {
	#name : #TodoItem,
	#superclass : #Object,
	#instVars : [
		'text',
		'checked'
	],
	#category : #TodoList
}

{ #category : #'instance creation' }
TodoItem class >> text: aString [

	^ self new
		  text: aString;
		  yourself
]

{ #category : #accessing }
TodoItem >> checked [

	^ checked
]

{ #category : #accessing }
TodoItem >> checked: aBoolean [

	checked := aBoolean
]

{ #category : #initialization }
TodoItem >> initialize [

	super initialize.
	checked := false
]

{ #category : #accessing }
TodoItem >> text [

	^ text
]

{ #category : #accessing }
TodoItem >> text: aString [

	text := aString
]
