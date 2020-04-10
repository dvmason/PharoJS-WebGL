"
I am a GL vertex shader
"
Class {
	#name : #GLVertexShader,
	#superclass : #GLShadingLanguage,
	#category : #'WebGL-Programs'
}

{ #category : #accessing }
GLVertexShader >> shaderType [
	^ VERTEX_SHADER
]
