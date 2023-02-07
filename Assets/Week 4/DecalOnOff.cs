using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DecalOnOff : MonoBehaviour
{
    Material mat;
    bool showDecal = false;

    void OnMouseDown()
    {
        showDecal = !showDecal;
        if (showDecal)
            mat.SetFloat("_ShowDecal", 1);
        else
            mat.SetFloat("_ShowDecal", 0);
    }
    void OnMouseOver()
    {
        Debug.Log("Mouse Over Works");
    }
    // Start is called before the first frame update
    void Start()
    {
        mat = this.GetComponent<Renderer>().sharedMaterial;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
