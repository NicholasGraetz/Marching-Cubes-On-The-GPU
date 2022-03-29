using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Particle : MonoBehaviour
{
    [SerializeField]
    private ParticleList particleList;

    private void OnEnable()
    {
        particleList.Entries.Value.Add(this);
    }

    private void OnDisable()
    {
        particleList.Entries.Value.Remove(this);
    }
}
