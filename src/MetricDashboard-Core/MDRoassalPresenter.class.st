Class {
	#name : #MDRoassalPresenter,
	#superclass : #RoassalModel,
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDRoassalPresenter class >> runMe [
<script>
self new openWithSpec 
]

{ #category : #api }
MDRoassalPresenter >> extent [ 
^800@650
]

{ #category : #initialize }
MDRoassalPresenter >> initialize [
super initialize .
self script: [ :aView :canvas| self mdDrawOnRoassalView: aView  ]
]

{ #category : #drawing }
MDRoassalPresenter >> mdDrawOnRoassalView: aView [
| shape els flags |

shape := RTCompositeShape new.
shape
	add:
		(RTBox new
			color: #first;
			height: 20;
			width: 15).
shape
	add:
		(RTBox new
			color: #second;
			height: 20;
			width: 15)
	translateBy: 15 @ 0.
shape
	add:
		(RTBox new
			color: #third;
			height: 20;
			width: 15)
	translateBy: 30 @ 0.
flags := Dictionary new.
flags at: 'France' put: (Array with: Color blue with: Color white with: Color red).
flags at: 'Belgium' put: (Array with: Color black with: Color yellow with: Color red).
flags at: 'Romania' put: (Array with: Color blue with: Color yellow with: Color red).
flags at: 'Italia' put: (Array with: Color green with: Color white with: Color red).
els := shape elementsOn: flags values.
els @ RTDraggable @RTPopup .
aView addAll: els.
RTGridLayout new on: els.
^ aView
]
