// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "MarchingCubesGPUProject/DrawStructuredBuffer" 
{
	Properties
	{
		_BaseColor("Base Color", Color) = (1,1,1,1)
		_BaseMap("Base Map", 2D) = "white" {}
	}

	SubShader 
	{
		Pass 
		{
			Cull Off

			CGPROGRAM
			#include "UnityCG.cginc"
			#pragma target 5.0
			#pragma vertex vert
			#pragma fragment frag
			
			struct Vert
			{
				float4 position;
				float3 normal;
			};
			
			uniform float4 _BaseColor;
			uniform sampler2D _BaseMap;
			uniform float4 _BaseMap_ST;

			uniform StructuredBuffer<Vert> _Buffer;
			uniform float4x4 _ModelMatrix;

			struct v2f 
			{
				float4  pos : SV_POSITION;
				float3 col : Color;
			};

			v2f vert(uint id : SV_VertexID)
			{
				Vert vert = _Buffer[id];

				v2f OUT;
				
				//OUT.pos = UnityObjectToClipPos(float4(vert.position.xyz, 1));
				OUT.pos = mul(UNITY_MATRIX_VP, mul(_ModelMatrix, vert.position));

				float4 color = dot(float3(0,1,0), vert.normal) * 0.5 + 0.5;
				color = color * _BaseColor;
				OUT.col = color;
				
				return OUT;
			}

			float4 frag(v2f IN) : COLOR
			{
				return float4(IN.col,1);
			}

			ENDCG

		}
	}
}