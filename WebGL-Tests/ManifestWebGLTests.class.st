"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestWebGLTests,
	#superclass : #PackageManifest,
	#category : #'WebGL-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestWebGLTests class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GLMockContext)) #'2020-07-15T09:40:50.748945-04:00') #(#(#RGClassDefinition #(#GLMockProgram)) #'2020-07-15T11:17:03.93944-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGLTests class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GLMockProgram)) #'2020-07-15T11:16:59.389322-04:00') )
]
