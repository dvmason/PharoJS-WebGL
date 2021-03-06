"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestWebGL,
	#superclass : #PackageManifest,
	#category : #'WebGL-Manifest'
}

{ #category : #'code-critics' }
ManifestWebGL class >> ruleGRClassVariableCapitalizationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GLGlobals)) #'2020-01-05T23:37:35.011276-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLProgram #addObject: #false)) #'2020-04-07T12:20:34.661094-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBExcessiveArgumentsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLContext #vertexAttribPointer:numComponents:type:normalize:stride:offset: #false)) #'2020-01-05T08:37:06.467923-05:00') #(#(#RGMethodDefinition #(#'GLContext class' #texImage2D:level:internalFormat:width:height:border:srcFormat:srcType:pixel: #true)) #'2020-03-13T19:14:32.513869-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBExcessiveVariablesRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GLConstants)) #'2020-01-06T15:41:09.20116-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLShadingLanguage #maybeAddSuffix:nested: #false)) #'2020-07-17T17:31:44.387311-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLShadingLanguage #asString #false)) #'2020-07-17T08:30:51.778275-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'GLContext class' #fromCanvas: #true)) #'2020-01-04T17:04:06.652267-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLProgram #linkProgram #false)) #'2020-04-09T12:17:03.951277-04:00') #(#(#RGMethodDefinition #(#GLShadingLanguage #maybeAddSuffix:nested: #false)) #'2020-07-17T17:31:38.619435-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLContext #animate: #false)) #'2020-01-09T11:46:24.986198-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBUncommonMessageSendRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GLContext)) #'2020-01-04T16:50:48.446127-05:00') #(#(#RGMethodDefinition #(#GLFragmentShader #shaderType #false)) #'2020-01-04T17:32:53.387099-05:00') #(#(#RGMethodDefinition #(#GLVertexShader #shaderType #false)) #'2020-01-04T17:33:01.893063-05:00') #(#(#RGMethodDefinition #(#GLShadingLanguage #compile #false)) #'2020-01-04T18:08:30.901512-05:00') #(#(#RGMethodDefinition #(#GLFragmentShader #shaderType: #false)) #'2020-01-04T19:56:17.140675-05:00') #(#(#RGMethodDefinition #(#GLVertexShader #shaderType: #false)) #'2020-01-04T19:56:30.067521-05:00') #(#(#RGMethodDefinition #(#'GLContext class' #loadConstants: #true)) #'2020-01-06T08:55:31.965387-05:00') #(#(#RGMethodDefinition #(#'GLConstants class' #loadConstants: #true)) #'2020-01-06T09:01:28.717691-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBUsesAddRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLProgram #addObject: #false)) #'2020-04-07T09:04:36.88955-04:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GLFragmentShader #shaderType: #false)) #'2020-01-04T19:56:20.926173-05:00') #(#(#RGMethodDefinition #(#GLVertexShader #shaderType: #false)) #'2020-01-04T19:56:26.812918-05:00') #(#(#RGMethodDefinition #(#GLContext #animate: #false)) #'2020-01-09T11:46:08.579821-05:00') )
]

{ #category : #'code-critics' }
ManifestWebGL class >> ruleReDeadMethodV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'GLContext class' #createBuffer #true)) #'2020-01-04T22:57:40.706608-05:00') )
]
