Shader "Custom/MyFirstShader"
{
	Properties{
		_myColor("Sample color",Color) = (1,1,1,1)
		_myEmission ("Sample emission", Color) = (1,1,1,1)
	}
		SubShader{
				CGPROGRAM
		#pragma surface surf lambert

				struct Input {
				float2 uvMainTex;
		};

	fixed4 _myColor;

	void surf (Input IN, inout SurfaceOutput o) {
		o.Albedo = _myColor.rgb;
		o.Emission = _myEmission.rgb;
	}
	ENDCG
	}
		FallBack "Diffuse"
}