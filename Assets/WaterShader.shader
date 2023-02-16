Shader "Custom/WaterShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo", 2D) = "white" {}
        _DisplacementMap("DisplacementMap",2D)="black"{}
        _DisplacementStrength("Displacement Strength", Range(0.0,1.0))=0.5
        _WaveFrequency("Wave Frequency", Range(0.1,10.0))=1.0
        _WaveSpeed("Wave Speed", Range(0.1,10.0))=1.0
        _WaveAmplitude("Wave Amplitude", Range(0.0,1.0))=0.1
    }
    SubShader
    {
        Tags {"Queue"="Transparent" "RenderType"="Opaque" }
        LOD 100

        CGPROGRAM

        #pragma surface surf Standard alpha
        #pragma target 3.0
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "UnityCG.cginc"

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_DisplacementMap;
        };

        sampler2D _MainTex;
        sampler2D _DisplacementMap;
        float4 _MainTex_ST;
        float4 _DisplacementMap_ST;
        float _DisplacementStrength;
        float _WaveFrequency;
        float _WaveSpeed;
        float _WaveAmplitude;

        void vert(inout appdata_full v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            o.uv_MainTex = TRANSFORM_TEX(v.texcoord, _MainTex);
            o.uv_DisplacementMap = TRANSFORM_TEX(v.texcoord, _DisplacementMap);

            float time = _Time.y;

            float waveDisplacement = sin((v.vertex.x * _WaveFrequency) + (time * _WaveSpeed)) * _WaveAmplitude;

            v.vertex.xyz += v.normal * waveDisplacement;
        }

        fixed4 frag (Input IN, SurfaceOutputStandard o)
        {
            fixed4 col = tex2D(_MainTex, IN.uv_MainTex);
            col.a = o.Alpha;
            UNITY_APPLY_FOG_COLOR(o.fogCoord, col, fixed4(0,0,0,0));
            return col;
        }
        ENDCG
    }
    FallBack "Diffuse"
}