using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerMovement : MonoBehaviour
{
    private bool isBloomOn;
    [SerializeField]
    private float speed = 5f;

    [SerializeField]
    Vector2 moveInput;
    Vector3 direction;

    [SerializeField]
    private List<GameObject> Lava;
    private bool lavaToggled;

    // Start is called before the first frame update
    void Start()
    {
        Lava.AddRange(GameObject.FindGameObjectsWithTag("Lava"));
        isBloomOn= true;
    }

    // Update is called once per frame
    void Update()
    {
        transform.position += direction * speed * Time.deltaTime;
    }
    void OnMove(InputValue value)
    {
        moveInput = value.Get<Vector2>();
        direction = new Vector3(moveInput.x, moveInput.y, 0);
    }
    void OnToggleLava()
    {
        if (lavaToggled) { 
        foreach (GameObject lava in Lava) {
            lava.GetComponent<Renderer>().material.SetFloat("_Speed", 100f);
        }
            lavaToggled= false;
        }
        else
        {
            foreach (GameObject lava in Lava)
            {
                lava.GetComponent<Renderer>().material.SetFloat("_Speed", 10f);
            }
            lavaToggled= true;
        }
    }
    void OnToggleBloom()
    {
        isBloomOn = !isBloomOn;
        GameObject.FindGameObjectWithTag("Enemy").GetComponent<EnemyMovement>().ToggleBloom = isBloomOn;       
    }
}
