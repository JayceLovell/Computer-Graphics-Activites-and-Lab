using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMovement : MonoBehaviour
{
    [SerializeField]
    private Material BloomMaterial;

    private readonly float startThreshold = 1.0f;
    private readonly float endThreshold = 0.2f;
    private readonly float duration = 1.0f;
    private float timer = 0f;
    private bool BloomOn;

    public Vector3 pos1 = new Vector3(-4, 0, 0);
    public Vector3 pos2 = new Vector3(4, 0, 0);
    public float speed = 1.0f;
    public bool ToggleBloom
    {
        get { return BloomOn; }
        set { BloomOn = value; }
    }
    void Start()
    {
        BloomOn = true; 
    }

    // Update is called once per frame
    void Update()
    {
        transform.position = Vector3.Lerp(pos1, pos2, (Mathf.Sin(speed * Time.time) + 1.0f) / 2.0f);

        if (BloomOn)
        {

            timer += Time.deltaTime;

            float threshold = Mathf.Lerp(startThreshold, endThreshold, Mathf.PingPong(timer, duration) / duration);

            if (BloomMaterial && BloomMaterial.HasProperty("_BloomThreshold"))
            {
                BloomMaterial.SetFloat("_BloomThreshold", threshold);
            }
        }
        else
        {
            BloomMaterial.SetFloat("_BloomThreshold", 1.0f);
        }
    }
}
