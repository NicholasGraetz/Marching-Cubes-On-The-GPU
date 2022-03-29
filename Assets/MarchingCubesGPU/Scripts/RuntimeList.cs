using System.Collections.Generic;
using UnityEngine;
using System;

public class RuntimeList<T> : ScriptableObject
{
    public Lazy<List<T>> Entries = new Lazy<List<T>>(() => new List<T>());
}
