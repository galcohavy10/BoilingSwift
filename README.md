# BoilingSwift

Boilerplate Swift code and distilled examples of core iOS concepts. Designed for **seasoned developers** who want a quick, copy-paste-ready reference or a concise review of essential Swift patterns.

> 📹 Main Source: Inspired by [Sean Allen’s Must Know Topics (YouTube)](https://www.youtube.com/watch?v=XTAziR-tY-A)

---

## 🔧 Purpose

This repo is a **hands-on Swift reference**, not a beginner tutorial. Each `.swift` file contains a compact example of a key concept—clear, minimal, and directly usable in real projects. It’s meant for engineers who:

- Need fast recall of core Swift ideas
- Want lightweight snippets to drop into projects
- Prefer learning by code over theory

---

## 📁 File Breakdown

### `ARCretainDemo.swift`
**Concept:** Memory Management & ARC  
**Focus:** Shows how retain cycles work in classes and how `weak` prevents memory leaks.  
**Includes:**  
- Example of two classes holding strong references to each other  
- `deinit` not being called unless `weak` is used  
- Practical commentary on how to avoid leaks in delegate patterns and closures

---

### `AsyncNetwork.swift`
**Concept:** Asynchronous Networking with `async/await`  
**Focus:** Modern Swift concurrency; non-blocking network requests using `URLSession`.  
**Includes:**  
- Simple API call using `async/await`  
- UI-safe update pattern  
- Basic error handling enum cases

---

### `Class-Struct.swift`
**Concept:** Reference vs Value Types  
**Focus:** Demonstrates how changes to classes vs structs behave differently when assigned.  
**Includes:**  
- Mutating a struct vs a class  
- A “Google Docs vs PDF copy” analogy, where the class is referenced and everyone's updating the same instance. 
- Why structs are safer for models, but classes are used for reference-sharing

---

### `DelegateDemo.swift`
**Concept:** Delegate & Protocol Pattern  
**Focus:** Communication between objects without tight coupling  
**Includes:**  
- Simple example of a `ViewController` passing data via a delegate  
- Comments explaining why we use `weak var delegate`  
- Realistic analogy: A boss (delegate) gives tasks to an intern (child object) without needing to know how the intern will do the work — as long as the intern follows the defined job description (protocol).

---

### `FilterMapReduce.swift`
**Concept:** Functional Programming in Swift  
**Focus:** The power of `.filter`, `.map`, and `.reduce` to transform collections  
**Includes:**  
- Real-world example (e.g. transforming a list of users)  
- Commentary on chaining and readability  
- Swift standard library idioms

---

### `Generics.swift`
**Concept:** Type Safety & Reusability  
**Focus:** Shows how to write generic functions and types  
**Includes:**  
- A generic `<T>` function  
- Explanation of why generics matter for performance and type safety  
- Short form vs verbose form of generic declarations

---

### `Optionals.swift`
**Concept:** Safe Handling of Missing Values  
**Focus:** The core concept of Swift’s type safety—optionals.  
**Includes:**  
- `if let`, `guard let`, and optional chaining examples  
- Commented insight into why Swift forces you to unwrap  
- Real-world mistakes prevented by optionals

---

### `Sets.swift`
**Concept:** Unique Collections  
**Focus:** Differences between `Set` and `Array`, and when to use each  
**Includes:**  
- Union, intersection, subtraction  
- Hashable requirements  
- Speed advantage in membership testing

---

### `Singleton.swift`
**Concept:** Global Shared State  
**Focus:** The `static let shared` pattern for singleton instances  
**Includes:**  
- Basic singleton setup  
- Commentary on when (and when *not*) to use singletons  
- Thread-safety notes

---

## 📎 Attribution

Big credit to [Sean Allen](https://www.youtube.com/@SeanAllen) and his educational content, especially the [Delegate & Protocol Pattern Tutorial](https://www.youtube.com/watch?v=XTAziR-tY-A). Many of these examples are based on or inspired by his demonstrations. His channel is a goldmine for leveling up as an iOS engineer.

---

## 🧠 Use Cases

- 📚 **Study:** Refresh your knowledge before interviews or deep work
- 🧪 **Prototype:** Drop in known-good code to scaffold new features
- 🧱 **Teach:** Use examples to explain concepts to junior devs

---

## 👋 Contributing

If you have a refined Swift snippet you often reuse, feel free to fork and add to the collection. Just keep it:
- Self-contained
- Minimal
- Focused on a single concept

---

## 📌 License

MIT – Use it, modify it, share it. If you find it helpful, a star would be appreciated ⭐

