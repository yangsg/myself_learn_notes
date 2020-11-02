



https://www.bilibili.com/video/BV1yz4y1X7Xh?p=1

# GO语言资深全栈工程师 新版完结(2020年)

https://www.bilibili.com/video/BV1ZZ4y1H7Y9?from=search&seid=17285546068093223529

# GO语言全套培训视频(2018年)



https://www.zhihu.com/question/30461290

# 想系统学习GO语言(Golang)，能推荐几本靠谱的书吗?



https://yalantis.com/blog/golang-vs-nodejs-comparison/

# Node.js vs Go: Which Is Better for Backend Web Development?

总结: go比nodejs 具有更好的并发性 和 可伸缩新。性能也更好。



https://go.ctolib.com/go/categories/go-guide.html

https://studygolang.com/



https://item.jd.com/50818630176.html

**包邮Go语言高级编程+Go Web编程+Go并发编程+Go语言实战+Go程序设计语言书籍**



**Go语言高并发与微服务实战 go语言编程教程书籍 Go语言入门教材书籍 golang教程自学Go语言**



<go in action> 书籍的源代码地址:

https://github.com/goinaction/code



# chapter01

硬件发展(多核) 

// more CPU cores

> go 开源，且能有效的利用多核(并发模型), 快如闪电的编译器

Go makes it easier for you to effectively
use all of the cores on your expensive server, and it takes away the penalty of
compiling a very large project.



## 1.1 Solving modern programming challenges with Go

> 使用 go 解决现代编程的挑战

c, c++执行很快

ruby, python 提供了快熟开发

然而, go 即这两类语言优点于一身(即提供快速的执行效率，又为开发者提供了快速开发的效率)

well-planned features and concise syntax.

> 精心策划的特性 和 简洁的语法

> Go also has a garbage collector (go也提供了自己的垃圾收集器)



### 并发

现代的计算机都是多核的。而其他的许多语言并没有利用这些资源的高效的工具，它们需要大量的线程同步代码，而这些代码还很容易出错。



go 的并发支持时很健壮的特性。Goroutines 类似于 threads, 但是它 使用少的多的内存和仅需编写很少的代码。

> Channels are data structures
> that let you send typed messages between goroutines with synchronization built
> in. This facilitates a programming model where you send data between goroutines,
> rather than letting the goroutines fight to use the same data. Let’s look at these features
> in more detail now.



#### GOROUTINES

Goroutines are functions that run concurrently with other goroutines, including the
entry point of your program.

> Goroutines 是可以与 其他 goroutines (包括程序的入口点) 并行执行的函数。其他语言可以使用 threads 来完成同样的事情，
>
> 但是 Goroutines  是执行是在单个的 thread 上的



> In Go, the net/http library, 

has concurrency built in using goroutines. Each inbound request automatically runs on
its own goroutine. Goroutines use less memory than threads and the Go runtime will
automatically schedule the execution of goroutines against a set of configured logical
processors. Each logical processor is bound to a single OS thread (see figure 1.2). This
makes your application much more efficient with significantly less development effort.

```go
func log(msg string){
... some logging code here
}
// Elsewhere in our code after we've discovered an error.
go log("something dire happened")  // 以 goroutine 的方式 “去” 调度执行 log
```



> As
> stated before, goroutines have minimal overhead, so it isn’t uncommon to spawn tens
> of thousands of them.

goroutines  的开销极小，所以创建 成千上万个 goroutines  并不是什么稀奇的事情。



#### CHANNELS

Channels are data structures that enable safe data communication between goroutines.





> Channels help to enforce the pattern that only one goroutine
> should modify the data at any time.

> Channels  使得 在任何时间点 仅有  一个 goroutine 能够 修改 data.



#### channel重要的注意事项

It’s important to note that channels don’t provide data access protection between
goroutines. If copies of data are exchanged through a channel, then each goroutine
has its own copy and can make any changes to that data safely. When pointers to the
data are being exchanged, each goroutine still needs to be synchronized if reads and
writes will be performed by the different goroutines.



> channel 并没有提供 goroutines 之间的 安全访问保护。如果 通过 a channel 实现 data 的 拷贝的交换，
>
> 则每个 goroutine  持有其自己的拷贝 且 能够安全地对其做任意的修改。但是当指向data 的 指针(pointers )‘被交换时，
>
> 每个 goroutine  在 被不同的 goroutines 执行读 和 写 操作时 仍然需要被同步.
>
> 



### 1.1.3 Go’s type system



- 组合 设计模式

在 go 中，类型是由更小的 类型组合而成的

Go developers simply embed types to reuse functionality in a design pattern
called composition. Other languages use composition, but it’s often deeply tied to
inheritance, which can make it complicated and difficult to use. In Go, types are composed
of smaller types, which is in contrast to traditional inheritance-based models.



##### TYPES ARE SIMPLE

go 拥有内置的 数据类型如 int, string 等，同时还支持 用户自定义的数据类型。

Go 的 struct 有点像 C 语言的 struct， 但是其还可以 声明操作其数据的 方法(method).

Rather than building a long inheritance structure—
Client extends User extends Entity—Go developers build small types—Customer
and Admin—and embed them into larger ones.



##### GO INTERFACES MODEL SMALL BEHAVIORS



> 继承是 is-a 关系，而 接口是  is-like-a 的关系(看起来像鸭子,那么可以认为它就是只鸭子)。



> In contrast, a Go interface typically represents just a single action. One of
> the most common interfaces you’ll use in Go is io.Reader. The io.Reader interface
>
> provides a simple way to declare that your type has data to be read in a way that other
> functions in the standard library understand. Here’s the definition:
>
> ```go
> type Reader interface {
> Read(p []byte) (n int, err error)
> }
> ```



> Go’s interfaces are smaller and more aligned with single
> actions. In practice, this allows significant advantages in code reuse and composability.
> You can implement an io.Reader on nearly any type that has data available, and then
> pass it to any Go function that knows how to read from io.Reader.



> The entire networking library in Go is built using the io.Reader interface, because
> it allows it to separate the network implementation required for each different network
> operation from the functionality of your application. It makes interfaces fun, elegant,
> and flexible. That same io.Reader enables simple operations with files, buffers,
> sockets, and any other data source. Using a single interface allows you to operate on
> data efficiently, regardless of the source.



### 1.1.4 Memory management

> 不恰当的内存管理会导致应用程序 崩溃 和 内存泄露，甚至导致 操作系统宕机。
>
> 而 Go 使用了 现代的 垃圾收集器 来为你完成 这种繁重的工作。



1.2 Hello, Go





# Go quick-start

> go 被 设计者 设计为一种高效(开发高效，运行高效) 且 不会失去访问 低级别编程结构的访问能力。这些平衡是通过最小化的一组关键字，内置函数和语法 来实现的。 Go 同时还提供了完善的标准库.其提供的各种核心包可以帮助程序员构建真实世界中基于 web- 或基于网络的 程序。



代码:

> https://github.com/goinaction/code/tree/master/chapter2/sample



## 2.1 Program architecture

> Listing 2.1 Project structure for the application

```txt
cd $GOPATH/src/github.com/goinaction/code/chapter2
    - sample
    - data
        data.json -- Contains a list of data feeds
    - matchers
        rss.go -- Matcher for searching rss feeds
    - search
        default.go -- Default matcher for searching data
        feed.go -- Support for reading the json data file
        match.go -- Interface support for using different matchers
        search.go -- Main program logic for performing search
        main.go -- Programs entry point

```



## 2.2 Main package

```go
/*
 语法规则: 
 	一个文件夹下的所有 code files 必须使用相同的 包名(package name)
 最佳实践:
   通常将 包名(package name) 命名为 文件夹的 name
*/

package main

import (
    /*
    导入标准库中的 "log" 和 "os" 包，即导入 包中的 code
    使之能访问其中的标识符:如types, functions, constants, and interfaces.
    */
    "log"
	"os"

    /*
    为了程序具有更好的可读性，Go 编译器不允许你导入一个没有被使用的包。
    
	而通过特殊标识符 “_” 这种技术，go 允许你初始化 a package(即调用 package 中每个源代码文件中的 init 函数)，即使
	你没有直接使用 该 package 中的任何的 标识符
    */
	_ "github.com/goinaction/code/chapter2/sample/matchers"
	"github.com/goinaction/code/chapter2/sample/search"
)

// init is called prior to main.
func init() {
	// Change the device for logging to stdout.
	log.SetOutput(os.Stdout)
}

// main is the entry point for the program.
func main() { // main 包中的 main 函数是程序的入口，如果 main 包中没有main函数，则build tools无法产生可执行程序 
	// Perform the search for the specified term.
	search.Run("president")
}
```



> go 语言中每个code file 都属于以 包(package), 即使是 main.go 也不例外。
>
> packages 定义了一个 编译 code 的一个单元。且包名提供了 定义在其中的 标识符(identifiers) 的间接层，就如同一个 名字空间(namespace). 这是的区分不同包中的 具有相同的 identifiers 成为可能。



##### Listing 2.6 main.go: lines 11–15

```go
package main

import (
	"log"
	"os"

	_ "github.com/goinaction/code/chapter2/sample/matchers"
	"github.com/goinaction/code/chapter2/sample/search"
)

// init is called prior to main.//注: 所有的 init 函数会在 main 函数之前被调用
func init() {
	// Change the device for logging to stdout.
	log.SetOutput(os.Stdout)
}

// main is the entry point for the program.
func main() {
	// Perform the search for the specified term.
	search.Run("president")
}
```



## 2.3 Search package

### 2.3.1 search.go

> https://github.com/goinaction/code/blob/master/chapter2/sample/search/search.go
>
> ```go
> package search //每个源码文件都在最顶部包含 package (关键字)语句
> 
> import ( 
> /* 从标准库中导入 log 包 和 sync 包，不想你从标准库外 import 代码的情况，
> 当从标准包中 import 时，仅需引用 package 的 name 即可。
> 编译器将总是从 GOROOT 和 GOPATH 环境变量引用的 locations 中查找 你 import 的 packages.
> */
> 	"log"
> 	"sync"
> 
> /*
> The log package provides support for logging messages to the stdout, stderr, or even
> custom devices. The sync package provides support for synchronizing goroutines,
> which is required by our program.
> */
> )
> 
> /*
> 位于任何 function 之外的 变量 被视为 包级别(package-level) 的变量。
> 
> 在 go 中， 标识符(identifiers) 既可以允许，也可以被禁止从 a package 中被导入(即 exported 或 unexported).
> 首字母大写的标识符(即 exported 的标识符) 可以在 其他 packages 导入其对应的 package 时被直接访问。
> 而首字母小写的标识符是 unexported 的，并能被其他包直接访问(注: 这并不意味着该 标识符 不可以被间接访问)。
> 
> map 是 引用类型，所以需要 make.
> map 的 零值(即默认值，zero value) 为 nil.
> 
> In Go, all variables are initialized to their zero value.
> 在go中，所有的变量会被初始化为其类型的 零值。
> 数值类型: 0
> strings: ""
> bool: false
> 指针: nil
> reference types: 初始化为其底层的数据结构的 zero value. 但是被声明为 引用类型的变量本身 会被初始化为其零值 nil.
> */
> // A map of registered matchers for searching.
> var matchers = make(map[string]Matcher)
> 
> 
> /*
> go 中使用 func 关键字来声明函数
> */
> // Run performs the search logic.
> func Run(searchTerm string) {
> /*
> A slice is a reference type that implements a dynamic array.
> slice 是引用类型，其实现了 动态数组。
> 
> go 语言中的函数可以返回 多个返回值。该特性经常被用于返回 a value 及 an error.
> 如果 产生了 error, 则任何其他从该函数调用中返回的值(values) 都是不可信(trusted) 的。
> 这时候这些返回的值(values) 应该被忽略。
> 
> :=  是一种简洁的声明操作符， 其被用于同时 对 variables 进行声明和初始化。
> 其返回的每个变量的类型(type) 将被 编译器 用于确定每个被声明变量的 type.
> 
> 
> A good rule of thumb when declaring variables is to use the keyword
> var when declaring variables that will be initialized to their zero value, and to
> use the short variable declaration operator when you’re providing extra initialization
> or making a function call.
> */
> 	// Retrieve the list of feeds to search through.
> feeds, err := RetrieveFeeds() //注: 标识符 RetrieveFeeds 属于 search 包。
> 	if err != nil {
> 		log.Fatal(err)
> 	}
> 
> /*
> Channels 属于引用类型，channels 实现了被用于在 goroutines 之间交换 data 的 被类型化的值(typed values)的队列，Channels 提供了天生的同步机制以使通信更加安全。
> */
> 	// Create an unbuffered channel to receive match results to display.
> 	results := make(chan *Result) //此处使用 内置函数 make 来创建非缓冲的 channel
> 
> /*
> 如下的代码两行代码用于防止 程序终止。
> 在 go 语言中，如果 main 函数返回了，则该程序也就终止了。此时任何被启动和仍保持运行的
> goroutines 也同样 会被 runtime 终止.
> 
> When you write concurrent programs, it’s best to cleanly terminate any goroutines
> that were launched prior to letting the main function return. Writing programs
> that can cleanly start and shut down helps reduce bugs and prevents resources from
> corruption.
> 
> Our program is using a WaitGroup from the sync package to track all the goroutines
> we’re going to launch. A WaitGroup is a great way to track when a goroutine is
> finished performing its work. A WaitGroup is a counting semaphore, and we’ll use it to
> count off goroutines as they finish their work.
> */
> 	// Setup a wait group so we can process all the feeds.
> 	var waitGroup sync.WaitGroup //sync.WaitGroup 被用于跟踪 a goroutine 完成其执行的工作。A WaitGroup 是一个计数的信号量。我们可以用其来 倒数(减去) 那些 结束其工作的 goroutines 的个数
> 
> 	// Set the number of goroutines we need to wait for while
> 	// they process the individual feeds.
> 	waitGroup.Add(len(feeds))
> 
>  /*
>  The keyword range can be used with arrays, strings, slices,
> maps, and channels.
> 	注: 关键字 range 可以被用于 数组，字符串，切片，映射 和 管道
> 	
> 	map：
> 	When a key doesn’t
> exist, the map will return the zero value for the type of value being stored in the map.
> When the key does exist, the map will return a copy of the value for that key.
>  */
> 	// Launch a goroutine for each feed to find the results.
> 	for _, feed := range feeds { // 此处的空白标识符 "_" 用于忽略对应的值
> 		// Retrieve a matcher for the search.
> 		matcher, exists := matchers[feed.Type]
> 		if !exists {
> 			matcher = matchers["default"]
> 		}
> 
>      /*
>      goroutine 是一个 function, 其从 程序的其他 functions 启动并独立云心。
>      通过 关键字 go 来 启动和调度 goroutines 来并行执行。
>      
>      In Go, all variables are passed by value.
>      go语言中 变量是按值传递
>      */
> 		// Launch the goroutine to perform the search.
> 		go func(matcher Matcher, feed *Feed) {//这里启动了 匿名函数， 且参数 feed 为指针类型
> 			Match(matcher, feed, searchTerm, results)
>          /*
>          There’s something else interesting about the method call to Done: the WaitGroup
> value was never passed into the anonymous function as a parameter, yet the anonymous
> function has access to it.
> 
> go 支持闭包，
> Go supports closures and you’re seeing this in action. In fact, the searchTerm and
> results variables are also being accessed by the anonymous function via closures.
> Thanks to closures, the function can access those variables directly without the need to
> pass them in as parameters. The anonymous function isn’t given a copy of these variables;
> it has direct access to the same variables declared in the scope of the outer function.
> This is the reason why we don’t use closures for the matcher and feed variables.
>          */
> 			waitGroup.Done()
> 		}(matcher, feed)
> 	}
> 
> 	// Launch a goroutine to monitor when all the work is done.
> 	go func() {
>      
>      /*
>      此处的 Wait() 调用会导致 goroutine 的阻塞，知道WaitGroup 的count 变为 0.
>      */
> 		// Wait for everything to be processed.
> 		waitGroup.Wait()
> 
> 		// Close the channel to signal to the Display
> 		// function that we can exit the program.
> 		close(results)
> 	}()
> 
> 	// Start displaying results as they are available and
> 	// return after the final result is displayed.
>     Display(results) 
>     /*
>      注: 此处的 Display 函数会发生阻塞以阻止 主线程 在 goroutines 之前提前终止。
>          其内部会在 for-range loop 中读取 channel 中的数据，如果channel 中没有数据
>          则会发生阻塞，而 一旦 channel 被关闭(closed)了 则 for-range loop 就会终止。
>          
>          注: 联想 linux 中在 bash 命令行执行，如:
>          # echo hello | cat
>     */
>     
> }
> 
> // Register is called to register a matcher for use by the program.
> func Register(feedType string, matcher Matcher) {
> 	if _, exists := matchers[feedType]; exists {
> 		log.Fatalln(feedType, "Matcher already registered")
> 	}
> 
> 	log.Println("Register", feedType, "matcher")
> 	matchers[feedType] = matcher
> }
> ```
>
> 

##### Listing 2.9 GOROOT and GOPATH environmental variables

```go
GOROOT="/Users/me/go"
GOPATH="/Users/me/spaces/go/projects"
```







The code for lines 30 through 42 iterate through the list of data feeds we retrieved



> ## **feed.go**

```go
package search

import (
    //注：这里 "encoding/json" 中的 json 是报名， 而 encoding 是 a path
	"encoding/json"  //该包 支持对 json 的编码和解码
	"os" //该包支持操作系统的功能，如读取文件
)

const dataFile = "data/data.json" //声明了一个常量， 其采用了类型推导的语法特性，且其实 unexported 的常量

// Feed contains information we need to process a feed.
type Feed struct {
	Name string `json:"site"`
	URI  string `json:"link"`
	Type string `json:"type"`
}

// RetrieveFeeds reads and unmarshals the feed data file.
func RetrieveFeeds() ([]*Feed, error) {
	// Open the file.
	file, err := os.Open(dataFile)
	if err != nil {
		return nil, err
	}

	// Schedule the file to be closed once
	// the function returns.
	defer file.Close()

	// Decode the file into a slice of pointers
	// to Feed values.
	var feeds []*Feed
	err = json.NewDecoder(file).Decode(&feeds)

	// We don't need to check for errors, the caller can do this.
	return feeds, err
}
```



> ## **data.json**
>
> > 这些 data 需要被解码为 struct types 的 切片 以使其能够被我们的程序使用。
>
> ```json
> [
> {
> 	"site" : "npr",
> 	"link" : "http://www.npr.org/rss/rss.php?id=1001",
> 	"type" : "rss"
> },
> {
> 	"site" : "nbcnews",
> 	"link" : "http://rss.msnbc.msn.com/id/21491043/device/rss/rss.xml",
> 	"type" : "rss"
> },
> {
> 	"site" : "nbcnews",
> 	"link" : "http://rss.msnbc.msn.com/id/21491571/device/rss/rss.xml",
> 	"type" : "rss"
> },
> {
> 	"site" : "nbcnews",
> 	"link" : "http://rss.msnbc.msn.com/id/28180066/device/rss/rss.xml",
> 	"type" : "rss"
> }
> ]
> ```
>
> 



```go
// Feed contains information we need to process a feed.
type Feed struct {
    /*
    注: 此处包含了 tag 来提供元数据，以使 JSON decoding 函数利用其来创建 Feed type 值的 slice
    Each tag maps a field name in the struct type to
a field name in the document.
    */
	Name string `json:"site"`
	URI  string `json:"link"`
	Type string `json:"type"`
}
```



```go
// RetrieveFeeds reads and unmarshals the feed data file.
func RetrieveFeeds() ([]*Feed, error) {
	// Open the file.
	file, err := os.Open(dataFile) //利用os的函数打开文件，返回的是 执行file 的指正 和 error 变量
	if err != nil {
		return nil, err
	}

    /*
    使用关键字 defer 来计算调度 文件的关闭操作，其在函数返回时立刻被执行。
    使用完 file 之后 将其关闭 是我们的责任。
    是用 defer 计划调度 close 方法的调用 可以保证该 方法会被调用，即使是函数发生了 defer 或 异常结束。
    */
	// Schedule the file to be closed once
	// the function returns.
	defer file.Close()

	// Decode the file into a slice of pointers
	// to Feed values.
	var feeds []*Feed
    //func (dec *Decoder) Decode(v interface{}) error
	err = json.NewDecoder(file).Decode(&feeds)

	// We don't need to check for errors, the caller can do this.
	return feeds, err
}
```



### 2.3.3 match.go/default.go



```go
// Result contains the result of a search.
type Result struct {
	Field   string
	Content string
}

// Matcher defines the behavior required by types that want
// to implement a new search type.
type Matcher interface { //声明了一个 interface 类型
	Search(feed *Feed, searchTerm string) ([]*Result, error)
}
```

> You follow a naming convention in Go when naming interfaces. If the interface
> type contains only one method, the name of the interface ends with the er suffix. This
> is the exact case for our interface, so the name of the interface is Matcher. When multiple
> methods are declared within an interface type, the name of the interface should
> relate to its general behavior.



> ## **default.go**

```go
  
package search

/*
这里创建了一个 空的(empty) 的 struct,
而在创建 这种 空 struct 的值时，该空 struct 会分配 0 bytes 的内存。
这在你创建无状态的 类型时很有用。

An
empty struct allocates zero bytes when values of this type are created. They’re great
when you need a type but not any state.
*/
// defaultMatcher implements the default matcher.
type defaultMatcher struct{}

// init registers the default matcher with the program.
func init() {
	var matcher defaultMatcher
	Register("default", matcher)
}

/*
在声明 Search 方法时使用了 defaultMatcher 的 a value receiver

Whether we use a value or pointer
of the receiver type to make the method call, the compiler will reference or dereference
the value if necessary to support the call.
*/
// Search implements the behavior for the default matcher.
func (m defaultMatcher) Search(feed *Feed, searchTerm string) ([]*Result, error) {
	return nil, nil
}
```



> 最佳实践: 使用 pointer receivers 来声明 methods.

> It’s best practice to declare methods using pointer receivers, since many of the
> methods you implement need to manipulate the state of the value being used to make
> the method call.

> Unlike when you call methods directly from values and pointers, when you call a
> method via an interface type value, the rules are different. Methods declared with
> pointer receivers can only be called by interface type values that contain pointers.
> Methods declared with value receivers can be called by interface type values that contain
> both values and pointers.

```go
[dev@node_dev b]$ cat demo.go 
package main

import (
  "fmt"
)

type AInterface interface {
  do()
}

type Person struct {

}

func (p *Person) do() { //最佳实践: 使用 pointer receiver,好处:1、提高效率 2、可修改值
  fmt.Println("interface do()")
}

func main() {
  var p Person
    var a AInterface = &p  //注意这里是将指针赋值给了 接口类型(注:如果是 value receiver 则没有此限制)
  a.do()
}

```



```go
// Method declared with a value receiver of type defaultMatcher
func (m defaultMatcher) Search(feed *Feed, searchTerm string)
// Declare a pointer of type defaultMatch
dm := new(defaultMatch) //注: 这里 dm 是一个指针
// The compiler will dereference the dm pointer to make the call
dm.Search(feed, "test")
// Method declared with a pointer receiver of type defaultMatcher
func (m *defaultMatcher) Search(feed *Feed, searchTerm string)
// Declare a value of type defaultMatch
var dm defaultMatch
// The compiler will reference the dm value to make the call
dm.Search(feed, "test")
```



> ## **match.go** 

```go
package search

import (
	"log"
)

// Result contains the result of a search.
type Result struct {
	Field   string
	Content string
}

// Matcher defines the behavior required by types that want
// to implement a new search type.
type Matcher interface {
	Search(feed *Feed, searchTerm string) ([]*Result, error)
}

// Match is launched as a goroutine for each individual feed to run
// searches concurrently.
func Match(matcher Matcher, feed *Feed, searchTerm string, results chan<- *Result) {
	// Perform the search against the specified matcher.
	searchResults, err := matcher.Search(feed, searchTerm)
	if err != nil {
		log.Println(err)
		return
	}

	// Write the results to the channel.
	for _, result := range searchResults {
		results <- result
	}
}

// Display writes results to the console window as they
// are received by the individual goroutines.
func Display(results chan *Result) {
    /*
    	这里管道会一直阻塞直到 一个 result 被写入到管道中。
    	当 一个 result 被写入到 channel 时该 for-range loop
    	会立刻被唤醒，且被给与该 result.
    	一旦管道被关闭(closed)了,则 for loop 也就终止了。
    	
       注: 联想 linux 中在 bash 命令行执行 设计到 管道的命令的的场景,
       如 前一个 process 没有向 stdout 写数据时，后面的 从 stdin 读数据的 proccess
       就会发生阻塞。而 process 写入数据时，后面读取的 process 也是立刻会唤醒。
       而当 管道被关闭是，则整个命令也就终止了。
    */
	// The channel blocks until a result is written to the channel.
	// Once the channel is closed the for loop terminates.
	for result := range results {
		log.Printf("%s:\n%s\n\n", result.Field, result.Content)
	}
}
```



## 2.4 RSS matcher



```xml
<rss xmlns:npr="http://www.npr.org/rss/" xmlns:nprml="http://api
<channel>
<title>News</title>
<link>...</link>
<description>...</description>
<language>en</language>
<copyright>Copyright 2014 NPR - For Personal Use
<image>...</image>
<item>
<title>
Putin Says He'll Respect Ukraine Vote But U.S.
</title>
<description>
The White House and State Department have called on the
</description>
```







```go
package matchers

import (
	"encoding/xml"
	"errors"
	"fmt"
	"log"
    "net/http" // 包(目录) "http" 在标准库的 子目录 "net" 中
	"regexp"

	"github.com/goinaction/code/chapter2/sample/search"
)

type (
	// item defines the fields associated with the item tag
	// in the rss document.
	item struct {
		XMLName     xml.Name `xml:"item"`
		PubDate     string   `xml:"pubDate"`
		Title       string   `xml:"title"`
		Description string   `xml:"description"`
		Link        string   `xml:"link"`
		GUID        string   `xml:"guid"`
		GeoRssPoint string   `xml:"georss:point"`
	}

	// image defines the fields associated with the image tag
	// in the rss document.
	image struct {
		XMLName xml.Name `xml:"image"`
		URL     string   `xml:"url"`
		Title   string   `xml:"title"`
		Link    string   `xml:"link"`
	}

	// channel defines the fields associated with the channel tag
	// in the rss document.
	channel struct {
		XMLName        xml.Name `xml:"channel"`
		Title          string   `xml:"title"`
		Description    string   `xml:"description"`
		Link           string   `xml:"link"`
		PubDate        string   `xml:"pubDate"`
		LastBuildDate  string   `xml:"lastBuildDate"`
		TTL            string   `xml:"ttl"`
		Language       string   `xml:"language"`
		ManagingEditor string   `xml:"managingEditor"`
		WebMaster      string   `xml:"webMaster"`
		Image          image    `xml:"image"`
		Item           []item   `xml:"item"`
	}

	// rssDocument defines the fields associated with the rss document.
	rssDocument struct {
		XMLName xml.Name `xml:"rss"`
		Channel channel  `xml:"channel"`
	}
)

// rssMatcher implements the Matcher interface.
type rssMatcher struct{}

// init registers the matcher with the program.
func init() {
	var matcher rssMatcher
	search.Register("rss", matcher)
}

// Search looks at the document for the specified search term.
func (m rssMatcher) Search(feed *search.Feed, searchTerm string) ([]*search.Result, error) {
	var results []*search.Result

	log.Printf("Search Feed Type[%s] Site[%s] For URI[%s]\n", feed.Type, feed.Name, feed.URI)

	// Retrieve the data to search.
	document, err := m.retrieve(feed)
	if err != nil {
		return nil, err
	}

	for _, channelItem := range document.Channel.Item {
		// Check the title for the search term.
		matched, err := regexp.MatchString(searchTerm, channelItem.Title)
		if err != nil {
			return nil, err
		}

		// If we found a match save the result.
		if matched {
			results = append(results, &search.Result{
				Field:   "Title",
				Content: channelItem.Title,
			})
		}

		// Check the description for the search term.
		matched, err = regexp.MatchString(searchTerm, channelItem.Description)
		if err != nil {
			return nil, err
		}

		// If we found a match save the result.
		if matched {
			results = append(results, &search.Result{
				Field:   "Description",
				Content: channelItem.Description,
			})
		}
	}

	return results, nil
}

// retrieve performs a HTTP Get request for the rss feed and decodes the results.
func (m rssMatcher) retrieve(feed *search.Feed) (*rssDocument, error) {
	if feed.URI == "" {
		return nil, errors.New("No rss feed uri provided")
	}

	// Retrieve the rss feed document from the web.
	resp, err := http.Get(feed.URI)
	if err != nil {
		return nil, err
	}

	// Close the response once we return from the function.
	defer resp.Body.Close()

	// Check the status code for a 200 so we know we have received a
	// proper response.
	if resp.StatusCode != 200 {
		return nil, fmt.Errorf("HTTP Response Error %d\n", resp.StatusCode)
	}

	// Decode the rss feed document into our struct type.
	// We don't need to check for errors, the caller can do this.
	var document rssDocument
	err = xml.NewDecoder(resp.Body).Decode(&document)
	return &document, err
}
```





# Packaging and tooling

> All .go files must declare the package that they belong to as the first line of the file
> excluding whitespace and comments. Packages are contained in a single directory.
> You may not have multiple packages in the same directory, nor may you split a package
> across multiple directories. This means that all .go files in a single directory must
> declare the same package name.

> 所有的 .go 必须声明其 所属的 package. packages 被包含在唯一的  目录中。在同一个目录中你不能拥有多个包。
>
> 也不同将 一个 package 切分到多个目录中。这就意味着 一个目录中的所有 .go 文件必须声明相同的 package name.
>
> 即同一目录下的所以 .go files 必须同一个相同的 package.



## 3.1 Packages



### 3.1.1 Package-naming conventions

包的命名约定(最佳实践): 将包 命名为和 其所在的 目录名一致。且遵循短小，精简 和 小写字符的原则。

> When naming
> your packages and their directories, you should use short, concise, lowercase names,
> because they will be typed often while you’re developing. The packages under
> net/http are great examples of concise names such as cgi, httputil, and pprof.



> 记住: package name 在其 package 被导入时将作为默认的 name. 但这是可以被覆盖(改写)的。
>
> 这对在你需要导入多个同名的不同 packages 时很有用。

Keep in mind that a unique name is not required, because you import the package
using its full path. Your package name is used as the default name when your package
is imported, but it can be overridden. This is beneficial when you need to import multiple
packages with the same name.



### 3.1.2 Package main

> 特殊的 main 包名，其指示 go 命令 该包 要被编译成 二进制可执行的。所有的go的可执行程序
>
> 都必须包含 名为 main 的 包。
>
> It designates to the Go command
> that this package is intended to be compiled into a binary executable. All of the executable
> programs you build in Go must have a package called main.



> 编译器遇到 main 包时，会查找 main() 函数，如果没找到，则二进制可执行文件不会被创建。
>
> main() 函数就是程序的入口点。

> When the main package is encountered by the compiler, it must also find a function
> called main(); otherwise a binary executable won’t be created. The main() function is
> the entry point for the program, so without one, the program has no starting point. The
> name of the



> 术语 commands  表示 可执行程序。而 PACKAGES  表示可以具有功能性的可被导入的语义单元。	  

> COMMANDS AND PACKAGES The Go documentation uses the term command
> frequently to refer to an executable program—like a command-line application.
> This can be confusing for new Go developers who are reading the documentation.
> Remember that in Go, a command is any executable program, in
> contrast to a package, which generally means an importable semantic unit of
> functionality.



>  Listing 3.1 Traditional Hello World! application
>



> 获取 packages 的帮助文档
>
> https://golang.google.cn/pkg/fmt/

```bash
[dev@node_dev go]$ go doc fmt  #以命令行的方式查看包 fmt 的文档
```



## 3.2 Imports



```go
import ( //告诉编译器去哪个包找你想要引用的 code
  "fmt"
  "strings"
)

```



> > 标准库中的包是在 go 的安装目录下查找，而 其他库是在 GOPATH 环境变量引用的目录下查找的
>
> Packages are found on disk based on their relative path to the directories referenced
> by the Go environment. Packages in the standard library are found under where Go is
> installed on your computer. Packages that are created by you or other Go developers
> live inside the GOPATH, which is your own personal workspace for packages.
>
> 
>
> Let’s take a look at an example. If Go was installed under /usr/local/go and your
> GOPATH was set to /home/myproject:/home/mylibraries, the compiler would look for
> the net/http package in the following order:

/usr/local/go/src/pkg/net/http <---- 这就是标准库 "net/http" 所在的位置
/home/myproject/src/net/http
/home/mylibraries/src/net/http



> 编译器找到了 符合的 a package 就立刻停止查找。牢记一点: 编译器会首先查找 go 的安装目录，
>
> 然后按 GOPATH  中列出的目录顺序依次查找。如果知道最后都没有找到符合的包，则你在 运行或 build
>
> 的时候得到一个 error.
>
> The compiler will stop searching once it finds a package that satisfies the import statement.
> The important thing to remember is that the Go installation directory is the
> first place the compiler looks and then each directory listed in your GOPATH in the
> order that they’re listed.
>
> If the compiler searches your GOPATH and never finds the package that you’ve referenced,
> you’ll get an error when you try to run or build your program. You’ll see how
> to use the go get command to fix those problems later in this chapter.



## 3.2.1 Remote imports

> There’s a huge trend toward sharing code via distributed version control systems
> (DVCS) such as sharing sites like GitHub, Launchpad, and Bitbucket. The Go tooling
> has built-in support for fetching source code from these sites and others. The import
> path can be used by the Go tooling to determine where the code you need fetched is
> on the network
>
> > For example:

```go

import "github.com/spf13/viper"
```

> When you try to build a program with this import path, the go build command will
> search the GOPATH for this package location on disk. The fact that it represents a URL
> to a repository on GitHub is irrelevant as far as the go build command is concerned.
> When an import path contains a URL, the Go tooling can be used to fetch the package
> from the DVCS and place the code inside the GOPATH at the location that matches the
> URL. This fetching is done using the go get command. go get will fetch any specified
> URL or can be used to fetch the dependencies a package is importing that are gogettable.
> Since go get is recursive, it can walk down the source tree for a package and
> fetch all the dependencies it finds.



## 3.2.2 Named imports

命名的导入

导入同名的不同包时可以为 包 给与一个新的名称(区别于默认名)以示区分，从而避免冲突。

>Listing 3.4 Renaming imports
>
>```go
>package main
>
>import (
>  "fmt"
>  myfmt "mylib/fmt"  //这里将自己的 fmt 包重命名为新名字 myfmt
>)
>
>func main() {
>  fmt.Println("Standard Library")
>  myfmt.Println("mylib/fmt")
>}
>```
>
>



导入一个未被使用的包 在编译时会失败。这样设计是为了避免无意中编译出包含无用代码的体积很大的二进制程序。



> Sometimes you may need to import a package that you don’t need to reference
> identifiers from. You’ll see why this might be useful in the next section. When this is
> the case, you can use the blank identifier _ to rename an import.
>
> > BLANK IDENTIFIER The _ (underscore character) is known as the blank identifier
> > and has many uses within Go. It’s used when you want to throw away the
> > assignment of a value, including the assignment of an import to its package
> > name, or ignore return values from a function when you’re only interested in
> > the others.



## 3.3 init

Each package has the ability to provide as many init functions as necessary to be
invoked at the beginning of execution time. All the init functions that are discovered
by the compiler are scheduled to be executed prior to the main function being executed.
The init functions are great for setting up packages, initializing variables, or
performing any other bootstrapping you may need prior to the program running.



An example of this is database drivers. They register themselves with the sql package
when their init function is executed at startup because the sql package can’t
know about the drivers that exist when it’s compiled. Let’s look at an example of what
an init function might do.



> Listing 3.5 init function usage

```go
package postgres

import (
  "database/sql"
)

func init() {
  sql.Register("postgres", new(PostgresDriver))
}
```



This code lives inside your pretend database driver for the PostgreSQL database.
When a program imports this package, the init function will be called, causing the
database driver to be registered with Go’s sql package as an available driver.



In the program that we write using this new database driver, we’ll use the blank
identifier to import the package so the new driver is included with the sql package. As
stated earlier, you can’t import a package that you aren’t using, so renaming the
import with the blank identifier allows the init function to be discovered and scheduled
to run without the compiler issuing an error about unused imports.
Now we can tell the sql.Open method to use this driver.

```go
package main

import (
  "database/sql"

  _ "github.com/goinaction/code/chapter3/dbdriver/postgres"
)

func main() {
  sql.Open("postgres", "mydb")
}
```



## 3.4 Using Go tools

```go
[dev@node_dev b]$ go

[dev@node_dev b]$ go help

[dev@node_dev b]$ go help run

```



```go
[dev@node_dev b]$ go build demo.go 
[dev@node_dev b]$ ./demo 

[dev@node_dev b]$ go clean demo.go

```





Building a package is a common practice, and the package can also be specified
directly:

> go build github.com/goinaction/code/chapter3/wordcount
>
> You can also specify wildcards in your package specifiers. Three periods in your package
> specifier indicate a pattern match ing any string. For example, the following command
> will build every package under the chapter3 directory:
>
> go build github.com/goinaction/code/chapter3/...



Instead of a package specifier, you can also use a path shortcut as an argument to most
of the Go commands. For example, you could achieve the same effect with these two
commands:

> go build wordcount.go
> go build . 





## 3.5 Going farther with Go developer tools

### 3.5.1 go vet

```bash
[dev@node_dev b]$ go vet demo.go   # 检查语法错误
```



### 3.5.2 Go format

> go 默认使用 tab 作为缩进，这也是官方推荐的。不过你可以根据需要对其修改

```bash
[dev@node_dev b]$ go fmt demo.go
```



## 3.5.3 Go documentation



> 命令行快速显示开发文档

```bash
[dev@node_dev b]$ go doc tar
[dev@node_dev b]$ go doc fmt
[dev@node_dev go]$ go doc builtin.append
[dev@node_dev go]$ go doc builtin
[dev@node_dev go]$ go doc builtin.int64
[dev@node_dev go]$ go doc -src json.Decoder
[dev@node_dev go]$ go list /app/go/src/...
[dev@node_dev go]$ go list ...



```





> 使用 godoc 的 server

```go
godoc -http=:6060

```



```go
// Retrieve connects to the configuration repository and gathers
// various connection settings, usernames, passwords. It returns a
// config struct on success, or an error.
func Retrieve() (config, error) {
// ... omitted
}


```



```go
/*
Package usb provides types and functions for working with USB
devices. To connect to a USB device start by creating a new USB
connection with NewConnection
...
*/
package usb
```





## 3.6 Collaborating with other Go developers



### 3.6.1 Creating repositories for sharing



- PACKAGE SHOULD LIVE AT THE ROOT OF THE REPOSITORY

  > When you’re using go get, you specify the full path to the package that should be
  > imported. This means that when you create a repository that you intend to share, the
  > package name should be the repository name, and the package’s source should be in
  > the root of the repository’s directory structure.
  > A common mistake that new Go developers make is to create a code or src directory
  > in their public repository. Doing so will make the package’s public import longer.
  > Instead, just put the package source files at the root of the public repository.



- PACKAGES CAN BE SMALL

  > It’s common in Go to see packages that are relatively small by the standards of other
  > programming languages. Don’t be afraid to make a package that has a small API or
  > performs only a single task. That’s normal and expected.



- RUN GO FMT ON THE CODE

  > Just like any other open source repository, pe ople will look at your code to gauge the
  > quality of it before they try it out. You need to be running go fmt before checking anything in. It makes your code readable and puts everyone on the same page when
  > reading source code.



- DOCUMENT THE CODE

  > Go developers use godoc to read documentation, and http://godoc.org to read documentation
  > for open source packages. If you’ve followed go doc best practices in
  > documenting your code, your packages will appear well documented when viewed
  > locally or online, and people will find it easier to use.

  



## 3.7 Dependency management

依赖管理



> Community tools such as godep and vendor have solved the dependency problem by
> using a technique called vendoring and import path rewriting. The idea is to copy all
> the dependencies into a directory inside the project repo, and then rewrite any
> import paths that reference those dependencies by providing the location inside the
> project itself.



注: 现在应该使用 dep，而不是 godep 了

> [dep](https://github.com/golang/dep)





### 3.7.2 Introducing gb （废弃）



# Arrays, slices, and maps

数据结构: 数组、切片 和 映射



## 4.1 Array internals and fundamentals



> It makes sense to start with arrays because they form the base data structure for
> both slices and maps. Understanding how arrays work will help you appreciate the
> elegance and power that slices and maps provide.



### 4.1.1 Internals

> 固定长度的 包含相同 类型的 连续块的 一组元素

> An array in Go is a fixed-length data type that contains a contiguous block of elements
> of the same type. This could be a built-in type such as integers and strings, or it can be
> a struct type.



> Arrays are valuable data structures because the memory is allocated sequentially. Having
> memory in a contiguous form can help to keep the memory you use stay loaded
> within CPU caches longer. Using index arithmetic, you can iterate through all the elements
> of an array quickly. The type information for the array provides the distance in
> memory you have to move to find each element. Since each element is of the same type
> and follows each other sequentially, moving through the array is consistent and fast.



### 4.1.2 Declaring and initializing

An array is declared by specifying the type of data to be stored and the total number of
elements required, also known as the array’s length.

#### Listing 4.1 Declaring an array set to its zero value

```go
// Declare an integer array of five elements.
var array [5]int  //指定了 元素类型和长度，且被初始化为 零值(默认值)
```

> When variables in Go are declared, they’re always initialized to their zero value for
> their respective type, and arrays are no different. When an array is initialized, each
> individual element that belongs to the array is initialized to its zero value.



> A fast and easy way to create and initialize arrays is to use an array literal. Array literals
> allow you to declare the number of elements you need and specify values for those
> elements.

#### Listing 4.2 Declaring an array using an array literal

```go
// Declare an integer array of five elements.
// Initialize each element with a specific value.
array := [5]int{10, 20, 30, 40, 50} //使用数组字面值来声明数组
```



If the length is given as ..., Go will identify the length of the array based on the number
of elements that are initialized.

#### Listing 4.3 Declaring an array with Go calculating size

```go
// Declare an integer array.
// Initialize each element with a specific value.
// Capacity is determined based on the number of values initialized.
array := [...]int{10, 20, 30, 40, 50} // 长度为 ... 表示其由 用来初始化 的 原始的 numbers 来确定
```



If you know the length of the array you need, but are only ready to initialize specific
elements, you can use this syntax.

#### Listing 4.4 Declaring an array initializing specific elements

```go
// Declare an integer array of five elements.
// Initialize index 1 and 2 with specific values.
// The rest of the elements contain their zero value.
array := [5]int{1: 10, 2: 20}  //初始化 指定的 元素
```



### 4.1.3 Working with arrays

```go
// Declare an integer array of five elements.
// Initialize each element with a specific value.
array := [5]int{10, 20, 30, 40, 50}
// Change the value at index 2.
array[2] = 35
```





> You can have an array of pointers. Like in chapter 2, you use the * operator to access
> the value that each element pointer points to.

#### Listing 4.6 Accessing array pointer elements

```go
// Declare an integer pointer array of five elements.
// Initialize index 0 and 1 of the array with integer pointers.
array := [5]*int{0: new(int), 1: new(int)}
// Assign values to index 0 and 1.
*array[0] = 10
*array[1] = 20
```



go 语言中的 array 是 值类型

> An array is a value in Go. This means you can use it in an assignment operation. The
> variable name denotes the entire array and, therefore, an array can be assigned to
> other arrays of the same type.



#### Listing 4.7 Assigning one array to another of the same type

```go
// Declare a string array of five elements.
var array1 [5]string
// Declare a second string array of five elements.
// Initialize the array with colors.
array2 := [5]string{"Red", "Blue", "Green", "Yellow", "Pink"}
// Copy the values from array2 into array1.
array1 = array2
```



注: 数组的类型包含其 长度 和 其元素的类型。仅有相同类型的数组才能进行赋值

> The type of an array variable includes both the length and the type of data that can be
> stored in each element. Only arrays of the same type can be assigned.

```go
// Declare a string array of four elements.
var array1 [4]string
// Declare a second string array of five elements.
// Initialize the array with colors.
array2 := [5]string{"Red", "Blue", "Green", "Yellow", "Pink"}
// Copy the values from array2 into array1.
array1 = array2 //错误，因为 这两个数组的长度不同，而长度和元素类型都是构成 array 类型的组成部分
Compiler Error:
cannot use array2 (type [5]string) as type [4]string in assignment
```



Copying an array of pointers copies the pointer values and not the values that the
pointers are pointing to.

#### Listing 4.9 Assigning one array of pointers to another

```go
// Declare a string pointer array of three elements.
var array1 [3]*string
// Declare a second string pointer array of three elements.
// Initialize the array with string pointers.
array2 := [3]*string{new(string), new(string), new(string)}
// Add colors to each element
*array2[0] = "Red"
*array2[1] = "Blue"
*array2[2] = "Green"
// Copy the values from array2 into array1.
array1 = array2
```



### 4.1.4 Multidimensional arrays

多维数组

> Arrays are always one-dimensional, but they can be composed to create multidimensional
> arrays. Multidimensional arrays come in handy when you need to manage data
> that may have parent/child relationships or is associated with a coordinate system.



#### Listing 4.10 Declaring two-dimensional arrays

```go
// Declare a two dimensional integer array of four elements
// by two elements.
var array [4][2]int
// Use an array literal to declare and initialize a two
// dimensional integer array.
array := [4][2]int{{10, 11}, {20, 21}, {30, 31}, {40, 41}}
// Declare and initialize index 1 and 3 of the outer array.
array := [4][2]int{1: {20, 21}, 3: {40, 41}}
// Declare and initialize individual elements of the outer
// and inner array.
array := [4][2]int{1: {0: 20}, 3: {1: 41}}
```



### Listing 4.11 Accessing elements of a two-dimensional array

```go
// Declare a two dimensional integer array of two elements.
var array [2][2]int
// Set integer values to each individual element.
array[0][0] = 10
array[0][1] = 20
array[1][0] = 30
array[1][1] = 40
```



You can copy multidimensional arrays into each other as long as they have the same
type. The type of a multidimensional array is based on the length of each dimension
and the type of data that can be stored in each element.



#### Listing 4.12 Assigning multidimensional arrays of the same type

```go
// Declare two different two dimensional integer arrays.
var array1 [2][2]int
var array2 [2][2]int
// Add integer values to each individual element.
array2[0][0] = 10
array2[0][1] = 20
array2[1][0] = 30
array2[1][1] = 40
// Copy the values from array2 into array1.
array1 = array2
```

> Because an array is a value, you can copy individual dimensions.

#### Listing 4.13 Assigning multidimensional arrays by index

```go
// Copy index 1 of array1 into a new array of the same type.
var array3 [2]int = array1[1]
// Copy the integer found in index 1 of the outer array
// and index 0 of the interior array into a new variable of
// type integer.
var value int = array1[1][0]
```



### 4.1.5 Passing arrays between functions

> To see this in action, let’s create an array of one million elements of type int. On a
> 64-bit architecture, this would require eight million bytes, or eight megabytes, of memory.
> What happens when you declare an array of that size and pass it to a function?

#### Listing 4.14 Passing a large array by value between functions

```go
// Declare an array of 8 megabytes.
var array [1e6]int
// Pass the array to the function foo.
foo(array)
// Function foo accepts an array of one million integers.
func foo(array [1e6]int) {  //通过值传递数组参数，缺点: 开销很大
...
}
```



#### Listing 4.15 Passing a large array by pointer between functions

```go
// Allocate an array of 8 megabytes.
var array [1e6]int
// Pass the address of the array to the function foo.
foo(&array)
// Function foo accepts a pointer to an array of one million integers.
func foo(array *[1e6]int) {  //通过指针传递数组,优点: 性能优化
...
}
```



## 4.2 Slice internals and fundamentals

> slice: 作用类似动态数组，相关内置函数: append

slice is a data structure that provides a way for you to work with and manage collections
of data. Slices are built around the concept of dynamic arrays that can grow and
shrink as you see fit. They’re flexible in terms of growth because they have their own
built-in function called append, which can grow a slice quickly with efficiency. You can
also reduce the size of a slice by slicing out a part of the underlying memory. Slices
give you all the benefits of indexing, iteration, and garbage collection optimizations
because the underlying memory is allocated in contiguous blocks.



### 4.2.1 Internals

> slices 是一个很小的对象，其是对 底层数组的 抽象和操作，其数据结构中包含 3 个字段来包含帮助 go
>
> 来操作其底层数组的 元数据。
>
> 这3个字段分别表示: Pointer, Length, Capacity

Slices are tiny objects that abstract and manipulate an underlying array. They’re threefield
data structures that contain the metadata Go needs to manipulate the underlying
arrays (see figure 4.9).



> The three fields are a pointer to the underlying array, the length or the number of elements
> the slice has access to, and the capacity or the number of elements the slice has
> available for growth. The difference between length and capacity will make more
> sense in a bit.



### 4.2.2 Creating and initializing

> There are several ways to create and initialize slices in Go. Knowing the capacity you
> need ahead of time will usually determine how you go about creating your slice.

#### MAKE AND SLICE LITERALS

> 通过内置函数 make 创建 
>
> One way to create a slice is to use the built-in function make. When you use make, one
> option you have is to specify the length of the slice.

#### Listing 4.16 Declaring a slice of strings by length

```go
// Create a slice of strings.
// Contains a length and capacity of 5 elements.
slice := make([]string, 5) //当仅指定length参数时，则 capacity 与 length 相同
```

When you just specify the length, the capacity of the slice is the same. You can also
specify the length and capacity separately.



#### Listing 4.17 Declaring a slice of integers by length and capacity

```go
// Create a slice of integers.
// Contains a length of 3 and has a capacity of 5 elements.
slice := make([]int, 3, 5) //此处 length 为3, capacity 为 5
```

When you specify the length and capacity separately, you can create a slice with available
capacity in the underlying array that you don’t have access to initially.



The slice in listing 4.17 has access to three elements, but the underlying array has
five elements. The two elements not associated with the length of the slice can be
incorporated so the slice can use those elements as well. New slices can also be created
to share this same underlying array and use any existing capacity.
Trying to create a slice with a capacity that’s smaller than the length is not allowed.

#### Listing 4.18 Compiler error setting capacity less than length

```go
// Create a slice of integers.
// Make the length larger than the capacity.
slice := make([]int, 5, 3) //注: capacity 不能小于 length, 否则会报错
Compiler Error:
len larger than cap in make([]int)
```



> 一种惯用法是通过 slice  字面值 来 创建 slice.
>
> An idiomatic way of creating a slice is to use a slice literal. It’s similar to creating an
> array, except you don’t specify a value inside of the [ ] operator. The initial length
> and capacity will be based on the number of elements you initialize.

#### Listing 4.19 Declaring a slice with a slice literal

```go
// Create a slice of strings.
// Contains a length and capacity of 5 elements.
slice := []string{"Red", "Blue", "Green", "Yellow", "Pink"} //通过 slice 字面值来创建 slice
// Create a slice of integers.
// Contains a length and capacity of 3 elements.
slice := []int{10, 20, 30}
```



> When using a slice literal, you can set the initial length and capacity. All you need to
> do is initialize the index that represents the length and capacity you need. The following
> syntax will create a slice with a length and capacity of 100 elements.

#### Listing 4.20 Declaring a slice with index positions

```go
// Create a slice of strings.
// Initialize the 100th element with an empty string.
slice := []string{99: ""} //通过 index 配置来声明 切片，其length 和 capacity为 100
```



> 声明 数组 和  切片的区别

> Remember, if you specify a value inside the [ ] operator, you’re creating an array. If
> you don’t specify a value, you’re creating a slice.

#### Listing 4.21 Declaration differences between arrays and slices

```go
// Create an array of three integers.
array := [3]int{10, 20, 30} //在 [] 中指定 长度时 就是声明数组
// Create a slice of integers with a length and capacity of three.
slice := []int{10, 20, 30} //没有在 [] 中指定 长度时 就是声明 切片
```



##### NIL AND EMPTY SLICES

> 注:  nil  的 slice 和 empty 的  slice 是不同的。
>
>  nil 和 empty 类型的 slice 区别: 虽然它们的 length 和 capacity 都是 0, 但是 nil slice 内部的 pointer 为 nil, 而 empty slice 内部的 pointer 为某个 address.
>
> 注: 不管你使用的是 nil slice 还是 empty slice, 内置函数 append, len 和 cap 的工作都是一样的

> Sometimes in your programs you may need to declare a nil slice. A nil slice is created
> by declaring a slice without any initialization.

```go
// Create a nil slice of integers.
var slice []int  //声明了一个被初始化为 nil 的 slice 变量。注: slice 类型为 引用类型,其内部 pointer=nil, length 和 capacity 都为 0
```



> A nil slice is the most common way you create slices in Go. They can be used with
> many of the standard library and built-in functions that work with slices. They’re useful
> when you want to represent a slice that doesn’t exist, such as when an exception
> occurs in a function that returns a slice (see figure 4.10).



You can also create an empty slice by declaring a slice with initialization.

#### Listing 4.23 Declaring an empty slice

```go
// Use make to create an empty slice of integers.
slice := make([]int, 0) //通过 make 创建 length 为 0 的 empty slice
// Use a slice literal to create an empty slice of integers.
slice := []int{} //通过 slice 字面值创建 length 为 0 的 empty slice
```

An empty slice contains a zero-element underlying array that allocates no storage.
Empty slices are useful when you want to represent an empty collection, such as when
a database query returns zero results (see figure 4.11).

> 不管你使用的是 nil slice 还是 empty slice, 内置函数 append, len 和 cap 的工作都是一样的

Regardless of whether you’re using a nil slice or an empty slice, the built-in functions
append, len, and cap work the same.



### 4.2.3 Working with slices

Now that you know what a slice is and how to create them, you can learn how to use
them in your programs.

#### ASSIGNING AND SLICING

#### Listing 4.24 Declaring an array using an array literal

```go
// Create a slice of integers.
// Contains a length and capacity of 5 elements.
slice := []int{10, 20, 30, 40, 50}
// Change the value of index 1.
slice[1] = 25  //通过小标索引对 slice 元素进行赋值
```



> Slices (切片) 顾名思义，就是可以对数组进行部分切片以创建一个新的slice

Slices are called such because you can slice a portion of the underlying array to create
a new slice.



#### Listing 4.25 Taking the slice of a slice

```go
// Create a slice of integers.
// Contains a length and capacity of 5 elements.
slice := []int{10, 20, 30, 40, 50}
// Create a new slice.
// Contains a length of 2 and capacity of 4 elements.
newSlice := slice[1:3] //创建一个新的 slice,该新的 slice 的 pointer 为 &slice[1], length = 2, capacity=4

```

> After the slicing operation performed in listing 4.25, we have two slices that are sharing
> the same underlying array. However, each slice views the underlying array in a different
> way (see figure 4.12).



The original slice views the underlying array as having a capacity of five elements, but
the view of newSlice is different. For newSlice, the underlying array has a capacity of
four elements. newSlice can’t access the elements of the underlying array that are
prior to its pointer. As far as newSlice is concerned, those elements don’t even exist.
Calculating the length and capacity for any new slice is performed using the following
formula.



#### Listing 4.26 How length and capacity are calculated

```text
For slice[i:j] with an underlying array of capacity k
Length: j - i
Capacity: k - i
```



If you apply this formula to newSlice you get the following.

#### Listing 4.27 Calculating the new length and capacity

```text
For slice[1:3] with an underlying array of capacity 5
Length: 3 - 1 = 2
Capacity: 5 - 1 = 4
```



> Another way to look at this is that the first value represents the starting index position
> of the element the new slice will start with—in this case, 1. The second value represents
> the starting index position (1) plus the number of elements you want to include
> (2); 1 plus 2 is 3, so the second value is 3. Capacity will be the total number of elements
> associated with the slice.
> You need to remember that you now have two slices sharing the same underlying
> array. Changes made to the shared section of the underlying array by one slice can be
> seen by the other slice.

### Listing 4.28 Potential consequence of making changes to a slice

```go
// Create a slice of integers.
// Contains a length and capacity of 5 elements.
slice := []int{10, 20, 30, 40, 50}
// Create a new slice.
// Contains a length of 2 and capacity of 4 elements.
newSlice := slice[1:3]
// Change index 1 of newSlice.
// Change index 2 of the original slice.
newSlice[1] = 35
```



> After the number 35 is assigned to the second element of newSlice, that change can
> also be seen by the original slice in element 3 (see figure 4.13).
> A slice can only access indexes up to its length. Trying to access an element outside
> of its length will cause a runtime exception. The elements associated with a slice’s
> capacity are only available for growth. They must be incorporated into the slice’s
> length before they can be used.



### Listing 4.29 Runtime error showing index out of range

```go
// Create a slice of integers.
// Contains a length and capacity of 5 elements.
slice := []int{10, 20, 30, 40, 50}
// Create a new slice.
// Contains a length of 2 and capacity of 4 elements.
newSlice := slice[1:3]
// Change index 3 of newSlice.
// This element does not exist for newSlice.
newSlice[3] = 45
Runtime Exception:
panic: runtime error: index out of range
```

Having capacity is great, but useless if you can’t incorporate it into your slice’s length.
Luckily, Go makes this easy when you use the built-in function append.



#### GROWING SLICES

> One of the advantages of using a slice over using an array is that you can grow the
> capacity of your slice as needed. Go takes care of all the operational details when you
> use the built-in function append.
> To use append, you need a source slice and a value that is to be appended. When
> your append call returns, it provides you a new slice with the changes. The append function
> will always increase the length of the new slice. The capacity, on the other hand,
> may or may not be affected, depending on the available capacity of the source slice.



##### Listing 4.30 Using append to add an element to a slice

```go
// Create a slice of integers.
// Contains a length and capacity of 5 elements.
slice := []int{10, 20, 30, 40, 50}
// Create a new slice.
// Contains a length of 2 and capacity of 4 elements.
newSlice := slice[1:3]
// Allocate a new element from capacity.
// Assign the value of 60 to the new element.
newSlice = append(newSlice, 60)
```

After the append operation in listing 4.30, the slices and the underlying array will
look like figure 4.14.



> Figure 4.14 The underlying array after the append operation



> When there’s no available capacity in the underlying array for a slice, the append function
> will create a new underlying array, copy the existing values that are being referenced,
> and assign the new value.

##### Listing 4.31 Using append to increase the length and capacity of a slice

```go
// Create a slice of integers.
// Contains a length and capacity of 4 elements.
slice := []int{10, 20, 30, 40}
// Append a new value to the slice.
// Assign the value of 50 to the new element.
newSlice := append(slice, 50)
```



After this append operation, newSlice is given its own underlying array, and the capacity
of the array is doubled from its original size (see figure 4.15).



> 注: 对于 append 操作，其 slice 既有的 capacity 小于1000 个元素时， 岂会成倍增长。
>
> 而操作 1000 时，其 按 1.25 的因子 或 25%  的方式增长。当然，其增长算法可能会随着语言的发展而改变。

The append operation is clever when growing the capacity of the underlying array.
Capacity is always doubled when the existing capacity of the slice is under 1,000 elements.
Once the number of elements goes over 1,000, the capacity is grown by a factor
of 1.25, or 25%. This growth algorithm may change in the language over time.



> Figure 4.15 The new underlying array after the append operation



#### THREE INDEX SLICES



> 第3个 index 的目的不是增加 capacity, 而是用来限制 capacity 的

> There’s a third index option we haven’t mentioned yet that you can use when you’re
> slicing. This third index gives you control over the capacity of the new slice. The purpose
> is not to increase capacity, but to restrict the capacity. As you’ll see, being able to
> restrict the capacity of a new slice provides a level of protection to the underlying
> array and gives you more control over append operations.
>
> 



##### Listing 4.32 Declaring a slice of string using a slice literal

```go
// Create a slice of strings.
// Contains a length and capacity of 5 elements.
source := []string{"Apple", "Orange", "Plum", "Banana", "Grape"}
```



> Now let’s use the third index option to perform a slicing operation.

##### Listing 4.33 Performing a three-index slice

```go
// Slice the third element and restrict the capacity.
// Contains a length of 1 element and capacity of 2 elements.
slice := source[2:3:4]
```



After this slicing operation, we have a new slice that references one element from the
underlying array and has a capacity of two elements. Specifically, the new slice references
the Plum element and has capacity up to the Banana element, as shown in figure
4.17



We can apply the same formula that we defined before to calculate the new slice’s
length and capacity.



##### Listing 4.34 How length and capacity are calculated

```text
For slice[i:j:k] or [2:3:4]
Length: j - i or 3 - 2 = 1
Capacity: k - i or 4 - 2 = 2
```



> 如果你尝试设置一个 大于 可用的 capacity 的 capacity ，则你将得到一个 运行时错误。
>
> If you attempt to set a capacity that’s larger than the available capacity, you’ll get a runtime
> error.

##### Listing 4.35 Runtime error setting capacity larger than existing capacity

```go
// This slicing operation attempts to set the capacity to 4.
// This is greater than what is available.
slice := source[2:3:6]
Runtime Error:
panic: runtime error: slice bounds out of range
```



> 内置的 append 将首先使用 可用的 capacity ， 一点 capacity  用完了， 则其会分配新的 底层数组。

As we’ve discussed, the built-in function append will use any available capacity first.
Once that capacity is reached, it will allocate a new underlying array. It’s easy to forget
which slices are sharing the same underlying array. When this happens, making
changes to a slice can result in random and odd-looking bugs. Suddenly changes
appear on multiple slices out of nowhere.





>技巧: 通过将 新的 slice 的 capacity  设置为和其 length 相同，你能够强制第一个 append 操作就会使 其 脱离 new slice 底层的 数组。这种脱离 new slice 底层原始的 源数组可以使修改(change) 安全的执行。
>
>By having the option to set the capacity of a new slice to be the same as the length,
>you can force the first append operation to detach the new slice from the underlying
>array. Detaching the new slice from its original source array makes it safe to change.

##### Listing 4.36 Benefits of setting length and capacity to be the same

```go
// Create a slice of strings.
// Contains a length and capacity of 5 elements.
source := []string{"Apple", "Orange", "Plum", "Banana", "Grape"}
// Slice the third element and restrict the capacity.
// Contains a length and capacity of 1 element.
slice := source[2:3:3]
// Append a new string to the slice.
slice = append(slice, "Kiwi")
```

Without this third index, appending Kiwi to our slice would’ve changed the value of
Banana in index 3 of the underlying array, because all of the remaining capacity would
still belong to the slice. But in listing 4.36, we restricted the capacity of the slice to 1.
When we call append for the first time on the slice, it will create a new underlying
array of two elements, copy the fruit Plum, add the new fruit Kiwi, and return a new
slice that references this underlying array, as in figure 4.18.



With the new slice now having its own underlying array, we’ve avoided potential
problems. We can now continue to append fruit to our new slice without worrying if
we’re changing fruit to other slices inappropriately. Also, allocating the new underlying
array for the slice was easy and clean.



> The built-in function append is also a variadic function. This means you can pass multiple
> values to be appended in a single slice call. If you use the ... operator, you can
> append all the elements of one slice into another.
>
> > 使用 ... 操作符，你可以将一个 slice 中的所有元素 追加到 另一个 slice 中。

##### Listing 4.37 Appending to a slice from another slice

```go
// Create two slices each initialized with two integers.
s1 := []int{1, 2}
s2 := []int{3, 4}
// Append the two slices together and display the results.
fmt.Printf("%v\n", append(s1, s2...))
Output:
[1 2 3 4]
```

As you can see by the output, all the values of slice s2 have been appended to slice s1.
The value of the new slice returned by the append function is then displayed by the
call to Printf.



#### ITERATING OVER SLICES



> go 中可以结合特殊的关键字 range 和 for 关键字 一起来遍历 slices.
>
> Since a slice is a collection, you can iterate over the elements. Go has a special keyword
> called range that you use in conjunction with the keyword for to iterate over slices.



##### Listing 4.38 Iterating over a slice using for range

```go
// Create a slice of integers.
// Contains a length and capacity of 4 elements.
slice := []int{10, 20, 30, 40}
// Iterate over each element and display each value.
for index, value := range slice {
  fmt.Printf("Index: %d Value: %d\n", index, value)
}

/*
Output:
Index: 0 Value: 10
Index: 1 Value: 20
Index: 2 Value: 30
Index: 3 Value: 40
*/
```

> The keyword range, when iterating over a slice, will return two values. The first value
> is the index position and the second value is a copy of the value in that index position
> (see figure 4.19).



##### 重要:

> 很重要的一点是: range 将创建 value 的一个副本，而不是返回其引用。所以如果你使用该 返回的 value
>
> 的  address 作为 each element 的一个指正，则会导致错误。
>
> It’s important to know that range is making a copy of the value, not returning a reference.
> If you use the address of the value variable as a pointer to each element, you’ll
> be making a mistake. Let’s see why.

##### Listing 4.39 range provides a copy of each element

```go
// Create a slice of integers.
// Contains a length and capacity of 4 elements.
slice := []int{10, 20, 30, 40}
// Iterate over each element and display the value and addresses.
for index, value := range slice {
    fmt.Printf("Value: %d Value-Addr: %X ElemAddr: %X\n",
        value, &value, &slice[index])
}
/*
Output:
Value: 10 Value-Addr: 10500168 ElemAddr: 1052E100
Value: 20 Value-Addr: 10500168 ElemAddr: 1052E104
Value: 30 Value-Addr: 10500168 ElemAddr: 1052E108
Value: 40 Value-Addr: 10500168 ElemAddr: 1052E10C
*/
```



The address for the value variable is always the same because it’s a variable that contains
a copy. The address of each individual element can be captured using the slice
variable and the index value.

If you don’t need the index value, you can use the underscore character to discard
the value.

##### Listing 4.40 Using the blank identifier to ignore the index value

```go
// Create a slice of integers.
// Contains a length and capacity of 4 elements.
slice := []int{10, 20, 30, 40}
// Iterate over each element and display each value.
for _, value := range slice { //注: 这里使用 blank 标识符"_" 忽略/抛弃了 range slice 返回的 index值
    fmt.Printf("Value: %d\n", value)
}
/*
Output:
Value: 10
Value: 20
Value: 30
Value: 40
*/
```



> 注: 关键字 range 将总是从 slice 的开始位置 遍历 一个切片。如果你需要对于遍历  slice 的更多的控制，则你可以总是使用传统的 loop.
>
> The keyword range will always start iterating over a slice from the beginning. If you
> need more control iterating over a slice, you can always use a traditional for loop.

##### Listing 4.41 Iterating over a slice using a traditional for loop

```go
// Create a slice of integers.
// Contains a length and capacity of 4 elements.
slice := []int{10, 20, 30, 40}
// Iterate over each element starting at element 3.
for index := 2; index < len(slice); index++ {
  fmt.Printf("Index: %d Value: %d\n", index, slice[index])
}
/*
Output:
Index: 2 Value: 30
Index: 3 Value: 40
*/
```



> 存在两个 作用于 arrays, slices 和  channels 的内置函数, 即 len 和 cap 函数。
>
> There are two special built-in functions called len and cap that work with arrays,
> slices, and channels. For slices, the len function returns the length of the slice, and
> the cap function returns the capacity. In listing 4.41, we used the len function to
> determine when to stop iterating over the slice.



> Now that you know how to create and work with slices, you can use them to compose
> and iterate over multidimensional slices.



##### 4.2.4 Multidimensional slices

Like arrays, slices are one-dimensional, but they can be composed to create multidimensional
slices for the same reasons we discussed earlier.



> Like arrays, slices are one-dimensional, but they can be composed to create multidimensional
> slices for the same reasons we discussed earlier.



##### Listing 4.42 Declaring a multidimensional slice

```go
// Create a slice of a slice of integers.
slice := [][]int{{10}, {100, 200}}
```

We now have an outer slice of two elements that contain an inner slice of integers.
The values for our slice of a slice of integers will look like figure 4.20.



In figure 4.20 you can see how composition is working to embed slices into slices.
The outer slice contains two elements, each of which are slices. The slice in the first
element is initialized with the single integer 10 and the slice in the second element
contains two integers, 100 and 200.



> 
>
> Composition allows you to create very complex and powerful data structures. All of
> the rules you learned about the built-in function append still apply.

##### Listing 4.43 Composing slices of slices

```go
// Create a slice of a slice of integers.
slice := [][]int{{10}, {100, 200}}
// Append the value of 20 to the first slice of integers.
slice[0] = append(slice[0], 20)
```



##### Listing 4.43 Composing slices of slices

```go
// Create a slice of a slice of integers.
slice := [][]int{{10}, {100, 200}}
// Append the value of 20 to the first slice of integers.
slice[0] = append(slice[0], 20)
```



The append function and Go are elegant in how they handle growing and assigning the
new slice of integers back into the first element of the outer slice. When the operation



in listing 4.43 is complete, an entire new slice of integers and a new underlying array is
allocated and then copied back into index 0 of the outer slice, as shown in figure 4.21.
Even with this simple multidimensional slice, there are a lot of layers and values
involved. Passing a data structure like this between functions could seem complicated.
But slices are cheap and passing them between functions is trivial.



### 4.2.5 Passing slices between functions

Passing a slice between two functions requires nothing more than passing the slice by
value. Since the size of a slice is small, it’s cheap to copy and pass between functions.
Let’s create a large slice and pass that slice by value to our function called foo.

### Listing 4.44 Passing slices between functions

```go
// Allocate a slice of 1 million integers.
slice := make([]int, 1e6)
// Pass the slice to the function foo.
slice = foo(slice)
// Function foo accepts a slice of integers and returns the slice back.
func foo(slice []int) []int {
...
return slice
}
```



> 在 64 为架构中， 一个切片需要 24 字节的内存，即 pointer 字段需要 8 字节，length 和 capacity 各自又占用了 8 字节。
>
> 因为 与 slice 关联的 数据被包含在底层的 array 中，所以想 任何 function 传递  slice 的一个 拷贝都不是问题。因为仅拷贝的是 slice,而并没有拷贝底层的 array。

On a 64-bit architecture, a slice requires 24 bytes of memory. The pointer field
requires 8 bytes, and the length and capacity fields require 8 bytes respectively. Since
the data associated with a slice is contained in the underlying array, there are no problems
passing a copy of a slice to any function. Only the slice is being copied, not the
underlying array (see figure 4.22).



Passing the 24 bytes between functions is fast and easy. This is the beauty of slices. You
don’t need to pass pointers around and deal with complicated syntax. You just create
copies of your slices, make the changes you need, and then pass a new copy back.





## 4.3 Map internals and fundamentals

> 映射是一种数据结构，其提供了 非排序的 键/值 对 的集合。

A map is a data structure that provides you with an unordered collection of key/value
pairs.



You store values into the map based on a key. Figure 4.23 shows an example of a
key/value pair you may store in your maps. The strength of a map is its ability to
retrieve data quickly based on the key. A key works like an index, pointing to the value
you associate with that key.

> Figure 4.23 Relationship of key/value pairs



### 4.3.1 Internals



> 注: map 是无序的, 其内部是通过 hash table 来实现的
>
> Maps are collections, and you can iterate over them just like you do with arrays and
> slices. But maps are unordered collections, and there’s no way to predict the order in
> which the key/value pairs will be returned. Even if you store your key/value pairs in
> the same order, every iteration over a map could return a different order. This is
> because a map is implemented using a hash table, as shown in figure 4.24.



> Figure 4.24 Simple representation of the internal structure of a map



> map --> 桶
>
> The map’s hash table contains a collection of buckets. When you’re storing, removing,
> or looking up a key/value pair, everything starts with selecting a bucket. This is
> performed by passing the key—specified in your map operation—to the map’s hash
> function. The purpose of the hash function is to generate an index that evenly distributes
> key/value pairs across all available buckets.



> The better the distribution, the quicker you can find your key/value pairs as the
> map grows. If you store 10,000 items in your map, you don’t want to ever look at
> 10,000 key/value pairs to find the one you want. You want to look at the least number
> of key/value pairs possible. Looking at only 8 key/value pairs in a map of 10,000 items
> is a good and balanced map. A balanced list of key/value pairs across the right number
> of buckets makes this possible.



> The hash key that’s generated for a Go map is a bit longer than what you see in figure
> 4.25, but it works the same way. In our example, the keys are strings that represents
> a color. Those strings are converted into a numeric value within the scope of the
> number of buckets we have available for storage. The numeric value is then used to
> select a bucket for storing or finding the specific key/value pair. In the case of a Go
> map, a portion of the generated hash key, specifically the low order bits (LOB), is used
> to select the bucket.



If you look at figure 4.24 again, you can see what the internals of a bucket look like.
There are two data structures that contain the data for the map. First, there’s an array

> Figure 4.25 Simple view of how hash functions work

with the top eight high order bits (HOB) from the same hash key that was used to select
the bucket. This array distinguishes each individual key/value pair stored in the
respective bucket. Second, there’s an array of bytes that stores the key/value pairs.
The byte array packs all the keys and then all the values together for the respective
bucket. The packing of the key/value pairs is implemented to minimize the memory
required for each bucket.
There are a lot of other low-level implementation details about maps that are outside
the scope of this chapter. You don’t need to understand all the internals to learn
how to create and use maps. Just remember one thing: a map is an unordered collection
of key/value pairs.



### 4.3.2 Creating and initializing

There are several ways you can create and initialize maps in Go. You can use the builtin
function make, or you can use a map literal.



#### Listing 4.45 Declaring a map using make

```go
// Create a map with a key of type string and a value of type int.
dict := make(map[string]int) //使用 make 函数声明 map
// Create a map with a key and value of type string.
// Initialize the map with 2 key/value pairs.
dict := map[string]string{"Red": "#da1337", "Orange": "#e95a22"} //使用 map 字面值 声明 map
```

Using a map literal is the idiomatic way of creating a map. The initial length will be
based on the number of key/value pairs you specify during initialization.

> 注: key 可以是任意的 内置类型或 struct type(只要其值可被用于 == 操作符的表达式中)。
>
> 而 Slices, functions 和 包含 slices  的 struct types 不能被用作 map keys. 这件导致编译器错误。

> The map key can be a value from any built-in or struct type as long as the value can
> be used in an expression with the == operator. Slices, functions, and struct types that
> contain slices can’t be used as map keys. This will produce a compiler error.



##### Listing 4.46 Declaring an empty map using a map literal

```go
// Create a map using a slice of strings as the key.
dict := map[[]string]int{} // error, 不能使用 slice 作为 map 的 key,这将导致编译器错误
Compiler Exception:
invalid map key type []string
```





> 但是可以创建 value 为 slice 的 map
>
> There’s nothing stopping you from using a slice as a map value. This can come in
> handy when you need a single map key to be associated with a collection of data.



##### Listing 4.47 Declaring a map that stores slices of strings

```go
// Create a map using a slice of strings as the value.
dict := map[int][]string{}
```



### 4.3.3 Working with maps

Assigning a key/value pair to a map is performed by specifying a key of the proper
type and assigning a value to that key.

##### Listing 4.48 Assigning values to a map

```go
// Create an empty map to store colors and their color codes.
colors := map[string]string{}
// Add the Red color code to the map.
colors["Red"] = "#da1337"
```



> You can create a nil map by declaring a map without any initialization. A nil map
> can’t be used to store key/value pairs. Trying will produce a runtime error.



##### Listing 4.49 Runtime error assigned to a nil map

```go
// Create a nil map by just declaring the map.
var colors map[string]string
// Add the Red color code to the map.
colors["Red"] = "#da1337"
Runtime Error:
panic: runtime error: assignment to entry in nil map
```

Testing if a map key exists is an important part of working with maps. It allows you to
write logic that can determine if you’ve performed an operation or if you’ve cached
some particular data in the map. It can also be used to compare two maps to identify
what key/value pairs match or are missing.



When retrieving a value from a map, you have two choices. You can retrieve the
value and a flag that explicitly lets you know if the key exists.



##### Listing 4.50 Retrieving a value from a map and testing existence.

```go
// Retrieve the value for the key "Blue".
value, exists := colors["Blue"]
// Did this key exist?
if exists {
  fmt.Println(value)
}
```



> The other option is to just return the value and test for the zero value to determine if
> the key exists. This will only work if the zero value is not a valid value for the map.

##### Listing 4.51 Retrieving a value from a map testing the value for existence

```go
// Retrieve the value for the key "Blue".
value := colors["Blue"]
// Did this key exist?
if value != "" {
  fmt.Println(value)
}
```



> 在go 中当你索引一个 map 时，其总会返回一个 value, 即使该 key 不存在。在这种情况下，该 value 的数据类型的 零值会被返回。
>
> When you index a map in Go, it will always return a value, even when the key doesn’t
> exist. In this case, the zero value for the value’s type is returned.





> Iterating over a map is identical to iterating over an array or slice. You use the keyword
> range; but when it comes to maps, you don’t get back the index/value, you get
> back the key/value pairs.

##### Listing 4.52 Iterating over a map using for range

```go
// Create a map of colors and color hex codes.
colors := map[string]string{
    "AliceBlue": "#f0f8ff",
    "Coral": "#ff7F50",
    "DarkGray": "#a9a9a9",
    "ForestGreen": "#228b22",
}
// Display all the colors in the map.
for key, value := range colors { //使用 for-range 遍历 map
    fmt.Printf("Key: %s Value: %s\n", key, value)
}
```

> 可以使用内置函数删除 一个 key/value 对
>
> If you want to remove a key/value pair from the map, you use the built-in function
> delete.



##### Listing 4.53 Removing an item from a map

```go
// Remove the key/value pair for the key "Coral".
delete(colors, "Coral")  //使用内置函数删除 map 中的一个 key/value pairs
// Display all the colors in the map.
for key, value := range colors {
  fmt.Printf("Key: %s Value: %s\n", key, value)
}
```



This time when you iterate through the map, the color Coral would not be displayed
on the screen



### 4.3.4 Passing maps between functions

Passing a map between two functions doesn’t make a copy of the map. In fact, you can
pass a map to a function and make changes to the map, and the changes will be
reflected by all references to the map.

##### Listing 4.54 Passing maps between functions

```go
func main() {
// Create a map of colors and color hex codes.
colors := map[string]string{
    "AliceBlue": "#f0f8ff",
    "Coral": "#ff7F50",
    "DarkGray": "#a9a9a9",
    "ForestGreen": "#228b22",
}
// Display all the colors in the map.
for key, value := range colors {
  fmt.Printf("Key: %s Value: %s\n", key, value)
}
// Call the function to remove the specified key.
removeColor(colors, "Coral")
// Display all the colors in the map.
for key, value := range colors {
    fmt.Printf("Key: %s Value: %s\n", key, value)
}
}
// removeColor removes keys from the specified map.
func removeColor(colors map[string]string, key string) {
	delete(colors, key)
}
```



# Go’s type system



> Go 语言是静态类型的语言，这意味着编译器总是想知道程序中每个值的数据类型。
>
> 知道了类型信息后，编译器可以使 values 以一种安全的方式被使用。这减少了潜在的内存
>
> 破坏和 bugs, 且 为编译器生成高性能的代码提供了机会。
>
> Go is a statically typed programming language. What that means is the compiler
> always wants to know what the type is for every value in the program. When the
> compiler knows the type information ahead of time, it can help to make sure that
> the program is working with values in a safe way. This helps to reduce potential
> memory corruption and bugs, and provides the compiler the opportunity to produce
> more performant code.



> 类型为 编译器提供的类型: 
>
> 1. 内存如何分配 (value 的 内存占用size)
> 2. 内存如何表示 （如通过 类型的名称来表示）

A value’s type provides the compiler with two pieces of information: first, how
much memory to allocate—the size of the value—and second, what that memory
represents. In the case of many of the built-in types, size and representation are
part of the type’s name. A value of type int64 requires 8 bytes of memory (64 bits)

and represents an integer value. A float32 requires 4 bytes of memory (32 bits) and
represents an IEEE-754 binary floating-point number. A bool requires 1 byte of memory
(8 bits) and represents a Boolean value of true or false.



> 注: 某些类型是基于其代码被构建到的 机器的架构来表示的。如 int 在 64 为机器上占有 8 字节，
>
> 而在 32 位机器上 占用 4 字节。

Some types get their representation based on the architecture of the machine the
code is built for. A value of type int, for example, can either have a size of 8 bytes (64
bits) or 4 bytes (32 bits), depending on the architecture. There are other architecturespecific
types as well, such as all the reference types in Go. Luckily, you don’t need to
know this information to create or work with values. But if the compiler doesn’t know
this information, it can’t protect you from doing things that could cause harm inside
your programs and the machines they run on.



## 5.1 User-defined types



> Go 语言允许自定义类型。当声明一个新的类型时，就是构造一个声明来为 编译器提供 size 和 representation 信息。
>
> 有两种方式声明用户自定义类型。最常用的方式就是使用关键字 struct， 其允许你创建组合类型。
>
> Go allows you the ability to declare your own types. When you declare a new type, the
> declaration is constructed to provide the compiler with size and representation information,
> similar to how the built-in types work. There are two ways to declare a userdefined
> type in Go. The most common way is to use the keyword struct, which allows
> you to create a composite type.
> Struct types are declared by composing a fixed set of unique fields. Each field in a
> struct is declared with a known type, which could be a built-in type or another userdefined
> type.



##### Listing 5.1 Declaration of a struct type

```go
// user defines a user in the program.
type user struct {
	name string
	email string
	ext int
	privileged bool
}
```



##### Listing 5.2 Declaration of a variable of the struct type set to its zero value

```go
// Declare a variable of type user.
var bill user
```



> 当你声明变量时，其 variable 表示的值 总是会被初始化。该值可以被初始化为一个特殊的值或可以被初始化为一个零值。
>
> On line 10 in listing 5.2, the keyword var creates a variable named bill of type user.
> When you declare variables, the value that the variable represents is always initialized.
> The value can be initialized with a specific value or it can be initialized to its zero
> value, which is the default value for that variable’s type. For numeric types, the zero
>
> value would be 0; for strings it would be empty; and for Booleans it would be false. In
> the case of a struct, the zero value would apply to all the different fields in the struct.



> 惯用法: 使用 关键字 var 来声明被初始化为 零值的 变量，而使用 := 操作符来声明被初始化为非零值的变量。
>
> Any time a variable is created and initialized to its zero value, it’s idiomatic to use
> the keyword var. Reserve the use of the keyword var as a way to indicate that a variable
> is being set to its zero value. If the variable will be initialized to something other than
> its zero value, then use the short variable declaration operator with a struct literal.

##### Listing 5.3 Declaration of a variable of the struct type using a struct literal

```go
// Declare a variable of type user and initialize all the fields.
lisa := user{ //惯用法: 使用操作符 := 来声明被初始化为非 零值的 变量，:= 是一种快捷的 变量声明操作符
	name: "Lisa",
	email: "lisa@email.com",
	ext: 123,
	privileged: true,
}
```



> := 是一种快捷的 变量声明操作符
>
> Listing 5.3 shows how to declare a variable of type user and initialize the value to
> something other than its zero value. On line 13, we provide a variable name followed
> by the short variable declaration operator. This operator is the colon with the equals
> sign (:=). The short variable declaration operator serves two purposes in one operation:
> it both declares and initializes a variable. Based on the type information on the
> right side of the operator, the short variable declaration operator can determine the
> type for the variable.

Since we’re creating and initializing a struct type, we use a struct literal to perform
the initialization. The struct literal takes the form of curly brackets with the initialization
declared within them.



##### Listing 5.4 Creating a struct type value using a struct literal

```go
user{  //初始化是明确的指定 字段名 及其 值(每行一个字段), 这种形式下 其字段的顺序是不重要的。
	name: "Lisa",
	email: "lisa@email.com",
	ext: 123,
    privileged: true, //注：这里必须要加上 trailing 的逗号分隔符(即使其位于最后)
}
```



>  The struct literal can take on two forms for a struct type. Listing 5.4 shows the first
> form, which is to declare each field and value from the struct to be initialized on a
> separate line. A colon is used to separate the two, and it requires a trailing comma.
> The order of the fields doesn’t matter. The second form is without the field names
> and just declares the values.



##### Listing 5.5 Creating a struct type value without declaring the field names

```go
// Declare a variable of type user.
lisa := user{"Lisa", "lisa@email.com", 123, true} //创建的时候不明确指定字段名,这时values 的顺序很重要，其必须与struct 声明中的 字段顺序匹配。这种形式的创建也可以分散到多行，但通常都放到一行声明。
```

> 创建的时候不明确指定字段名,这时values 的顺序很重要，其必须与struct 声明中的 字段顺序匹配。
>
> 这种形式的创建也可以分散到多行，但通常都放到一行声明。
>
> 你不仅可以使用内置类型，你还可以使用用户自定义的类型。
>
> The values can also be placed on separate lines, but traditionally values are placed on
> the same line with no trailing comma when using this form. The order of the values
> does matter in this case and needs to match the order of the fields in the struct declaration.
> When declaring a struct type, you’re not limited to just the built-in types. You
> can also declare fields using other user-defined types.



> Listing 5.6 shows a new struct type named admin. This struct type has a field named
> person of type user, and then declares a second field named level of type string.
> When creating a variable of a struct type that has a field like person, initializing the
> type with a struct literal changes a little.

##### Listing 5.7 Using struct literals to create values for fields

```go
// Declare a variable of type admin.
fred := admin{
	person: user{
	name: "Lisa",
	email: "lisa@email.com",
	ext: 123,
	privileged: true,
},
	level: "super",
}
```



> In order to initialize the person field, we need to create a value of type user. This is
> exactly what we do on line 28 in listing 5.7. Using the struct literal form, a value of
> type user is created and assigned to the person field.



> 另一种声明用户自定义类型的方式是利用 已经存在的类型且将其作为该新类型的 类型说明(type specification)
>
> A second way to declare a user-defined type is by taking an existing type and using
> it as the type specification for the new type. These types are great when you need a
> new type that can be represented by an existing type. The standard library uses this
> type declaration to create high-level functionality from the built-in types.



##### Listing 5.8 Declaration of a new type based on an int64

```go
type Duration int64 //使用 int64 作为自定义类型的 类型说明(type specification),此时 int64 被称为 Duration 的base type, 注: 虽然 Duration 的基础类型是 int64, 但是编译器会将它们视为不同的类型.(这很好理解，此处Duration 是相对基础类型int64更加抽象的类型，如果以后想重构让 Duration 替换成采用不同的基础类型来存储，则 编译器的这种行为能提高更好的解耦 )
```



>  Listing 5.8 shows the declaration of a type from the time package of the standard
> library. Duration is a type that represents the duration of time down to the nanosecond.
> The type takes its representation from the built-in type int64. In the declaration
> of Duration, we say that int64 is the base type of Duration. Even though int64 is
>
> acting at the base type, it doesn’t mean Go considered them to be the same. Duration
> and int64 are two distinct and different types.



To better clarify what this means, look at this small program that doesn’t compile.

##### Listing 5.9 Compiler error assigning value of different types

```go
package main

type Duration int64

func main() {
	var dur Duration
	dur = int64(1000) //error, 因为编译器会视 Duration 和 int64 为不同的类型,编译器并不会执行隐式的数据类型转换
}
/*
prog.go:7: cannot use int64(1000) (type int64) as type Duration
in assignment
*/
```

The compiler is clear as to what the problem is. Values of type int64 can’t be used as
values of type Duration. In other words, even though type int64 is the base type for
Duration, Duration is still its own unique type. Values of two different types can’t be
assigned to each other, even if they’re compatible. The compiler doesn’t implicitly
convert values of different types.



## 5.2 Methods



> Methods provide a way to add behavior to user-defined types. Methods are really functions
> that contain an extra parameter that’s declared between the keyword func and
> the function name.

##### Listing 5.11 listing11.go

```go
// Sample program to show how to declare methods and how the Go
// compiler supports them.
package main

import (
	"fmt"
)

// user defines a user in the program.
type user struct {
	name  string
	email string
}

/*
  关键字 func 与 函数名之间的参数被称为 receiver,
  指定了 receiver 的函数被称为方法，其被 bind 到了特定的类型。
  
  存在 2 中类型的 receiver
*/
// notify implements a method with a value receiver.
func (u user) notify() {
	fmt.Printf("Sending User Email To %s<%s>\n",
		u.name,
		u.email)
}

// changeEmail implements a method with a pointer receiver.
func (u *user) changeEmail(email string) {
	u.email = email
}

// main is the entry point for the application.
func main() {
	// Values of type user can be used to call methods
	// declared with a value receiver.
	bill := user{"Bill", "bill@email.com"}
	bill.notify()

	// Pointers of type user can also be used to call methods
	// declared with a value receiver.
	lisa := &user{"Lisa", "lisa@email.com"}
	lisa.notify()

	// Values of type user can be used to call methods
	// declared with a pointer receiver.
	bill.changeEmail("bill@newdomain.com")
	bill.notify()

	// Pointers of type user can be used to call methods
	// declared with a pointer receiver.
	lisa.changeEmail("lisa@newdomain.com")
	lisa.notify()
}
```

Lines 16 and 23 of listing 5.11 show two different methods. The parameter between
the keyword func and the function name is called a receiver and binds the function to
the specified type. When a function has a receiver, that function is called a method.
When you run the program, you get the following output.



> 存在两种类型的 receiver, 即 value receivers(值接收者) 和 pointer receivers(指针接收者)
>
> There are two types of receivers in Go: value receivers and pointer receivers.



##### Listing 5.14 Declaration of a method with a value receiver

```go
func (u user) notify() {  // value receiver 的方法
```



> 当一个方法被声明为使用 value receiver(值接收者)时，则该 方法 将总是在基于 执行该方法调用时传递的receiver对象的拷贝进行操作。
>
> The receiver for notify is declared as a value of type user. When you declare a method
> using a value receiver, the method will always be operating against a copy of the value
> used to make the method call. Let’s skip to line 32 of the program in listing 5.11 to see
> a method call on notify.



##### Listing 5.15 listing11.go: lines 29–32

```go
// Values of type user can be used to call methods
// declared with a value receiver.
bill := user{"Bill", "bill@email.com"}
bill.notify()

```

Listing 5.15 shows a call to the notify method using a value of type user. On line 31,
a variable named bill of type user is declared and initialized with a name and email
address. Then on line 32, the notify method is called using the variable bill.

##### Listing 5.16 Calling a method from a variable

```go
bill.notify()
```

The syntax looks similar to when you call a function from a package. In this case however,
bill is not a package name but a variable name. When we call the notify
method in this case, the value of bill is the receiver value for the call and the notify
method is operating on a copy of this value.



> 你也可以使用指针来 调用 被声明为接收 value receiver 的方法(注: 实际上这只是 go 在底层还是最将其调整为满足 value receiver的规则的方式)

You can also call methods that are declared with a value receiver using a pointer.

##### Listing 5.17 listing11.go: lines 34–37

```go
// Pointers of type user can also be used to call methods
// declared with a value receiver.
lisa := &user{"Lisa", "lisa@email.com"}
lisa.notify()  //注：这里因为 notify 方法被声明为接收 value receiver, 而 lisa实际是一个pointer, 所以其实编译器在底层会在幕后将本行调整为 (*lisa).notify() 调用的形式。所以本行这种写法仅是 go 为开发者提供的一种便捷的写法。而 notify 方法仍然是在基于 copy 上做操作。
```

>Listing 5.17 shows a call to the notify method using a pointer of type user. On line
>36, a variable named lisa of pointer type user is declared and initialized with a name
>and email address. Then on line 37, the notify method is called using the pointer
>variable. To support the method call, Go adjusts the pointer value to comply with the
>method’s receiver. You can imagine that Go is performing the following operation.

##### Listing 5.18 What Go is doing underneath the code

```go
(*lisa).notify()  //go 语言编译器底层所做的调整
```

Listing 5.18 shows essentially what the Go compiler is doing to support the method
call. The pointer value is dereferenced so the method call is in compliance with the
value receiver. Once again, notify is operating against a copy, but this time a copy of
the value that the lisa pointer points to.





> 你也可以将方法声明为接收 pointer receivers.

You can also declare methods with pointer receivers.

##### Listing 5.19 listing11.go: lines 22–25

```go
// changeEmail implements a method with a pointer receiver.
func (u *user) changeEmail(email string) {
	u.email = email
}
```

> Listing 5.19 shows the declaration of the changeEmail method, which is declared with
> a pointer receiver. This time, the receiver is not a value of type user but a pointer of
> type user. When you call a method declared with a pointer receiver, the value used to
> make the call is shared with the method.



##### Listing 5.20 listing11.go: lines 36, 44–46

```go
lisa := &user{"Lisa", "lisa@email.com"}
// Pointers of type user can be used to call methods
// declared with a pointer receiver.
lisa.changeEmail("lisa@newdomain.com") //通过指针调用方法，使用 pointer receiver 的好处是效率快，能更改源值
```



In listing 5.20 you see the declaration of the lisa pointer variable followed by the
method call to changeEmail on line 46. Once the call to changeEmail returns, any
changes to the value that the lisa pointer points to will be reflected after the call.
This is thanks to the pointer receiver. Value receivers operate on a copy of the value
used to make the method call and pointer receivers operate on the actual value.



> 你也可用使用 value 来调用 其声明为接收 pointer receiver 的 方法。
>
> go 会对这种调用进行调整修改 以使其适应遵守 method 接收 pointer receiver 这一事实。
>
> You can also call methods that are declared with a pointer receiver using a value

##### Listing 5.21 listing11.go: line 31

```go
bill := user{"Bill", "bill@email.com"}
// Values of type user can be used to call methods
// declared with a pointer receiver.
bill.changeEmail("bill@newdomain.com")
```

In listing 5.21, you see the declaration of the variable bill and then a call to the
changeEmail method, which is declared with a pointer receiver. Once again, Go
adjusts the value to comply with the method’s receiver to support the call.



##### Listing 5.22 What Go is doing underneath the code

```go
(&bill).notify()  //go 背后所做的调整修改
```

> Listing 5.22 shows essentially what the Go compiler is doing to support the method
> call. In this case, the value is referenced so the method call is in compliance with the
> receiver type. This is a great convenience Go provides, allowing method calls with values
> and pointers that don’t match a method’s receiver type natively.
> Determining whether to use a value or pointer receiver can sometimes be confusing.
> There are some basic guidelines you can follow that come directly from the standard
> library.

## 5.3 The nature of types



> 注: 如果从某类型的值添加或删除时需要创建一个 new value, 则应该使用 value receiver.
>
> 如果从某类型的值添加或删除时 是修改既有的原始对象，则应该使用 pointer receiver.
>
> After declaring a new type, try to answer this question before declaring methods for
> the type. Does adding or removing something from a value of this type need to create
> a new value or mutate the existing one? If the answer is create a new value, then use
> value receivers for your methods. If the answer is mutate the value, then use pointer
> receivers. This also applies to how values of this type should be passed to other parts of
> your program. It’s important to be consistent. The idea is to not focus on what the
> method is doing with the value, but to focus on what the nature of the value is.



### 5.3.1 Built-in types

> 内置类型是 有 语言本身提供的 一组类型。如 numeric, string 和 Boolean 类型。
>
> 这些类型对其具有原始性质。因此，当从这些类型的值中添加或删除某些东西时，a new value
>
> 应该被创建。基于此，当传递这些类型的值给 functions 和methods 时,应该传递其的一份拷贝(copy).
>
> Built-in types are the set of types that are provided by the language. We know them as
> the set of numeric, string, and Boolean types. These types have a primitive nature to
> them. Because of this, when adding or removing something from a value of one of
> these types, a new value should be created. Based on this, when passing values of these
> types to functions and methods, a copy of the value should be passed. Let’s look at a
> function from the standard library that works with built-in values.

##### Listing 5.23 golang.org/src/strings/strings.go: lines 620–625

```go
func Trim(s string, cutset string) string {
	if s == "" || cutset == "" {
		return s
	}
	return TrimFunc(s, makeCutsetFunc(cutset))
}
```



> In listing 5.23, you see the Trim function, which comes from the strings package in
> the standard library. The Trim function is passed a string value to operate on and a
> string value with characters to find. It then returns a new string value that’s the result
> of the operation. The function operates on copies of the caller’s original string values
> and returns a copy of the new string value. Strings, just like integers, floats, and Booleans,
> are primitive data values and should be copied when passed in and out of functions
> or methods.
>
> 
>
> Let’s look at a second example of how the built-in types are treated as having a
> primitive nature.

##### Listing 5.24 golang.org/src/os/env.go: lines 38–44

```go
func isShellSpecialVar(c uint8) bool {
	switch c {
	case '*', '#', '$', '@', '!', '?', '0', '1', '2', '3', '4', '5',
		'6', '7', '8', '9':
		return true
	}
	return false
}

```

Listing 5.24 shows the isShellSpecialVar function from the env package. This function
is passed a value of type uint8 and returns a value of type bool. Note how pointers
aren’t being used to share the value for the parameter or return value. The caller
passes a copy of their uint8 value and receives a value of true or false.





### 5.3.2 Reference types



> 引用类型:：包括 slice, map, channel, interface 和 function 类型。
>
> Reference types in Go are the set of slice, map, channel, interface, and function types.
> When you declare a variable from one of these types, the value that’s created is called
> a header value. Technically, a string is also a reference type value. All the different
> header values from the different reference types contain a pointer to an underlying
> data structure. Each reference type also contains a set of unique fields that are used to
> manage the underlying data structure. You never share reference type values because
> the header value is designed to be copied. The header value contains a pointer; therefore,
> you can pass a copy of any reference type value and share the underlying data
> structure intrinsically.



Let’s look at a type from the net package.

##### Listing 5.25 golang.org/src/net/ip.go: line 32

```go
type IP []byte //当你想为  builtin 的类型或引用类型声明某种行为时，想这样声明一个类型很有用。这样编译器就仅允许你为自定义类型的名字声明方法
```

> Listing 5.25 shows a type called IP which is declared as a slice of bytes. Declaring a type
> like this is useful when you want to declare behavior around a built-in or reference type.
> The compiler will only let you declare methods for user-defined types that are named.



##### Listing 5.26 golang.org/src/net/ip.go: lines 329–337

```go
func (ip IP) MarshalText() ([]byte, error) {
	if len(ip) == 0 {
		return []byte(""), nil
	}
	if len(ip) != IPv4len && len(ip) != IPv6len {
		return nil, errors.New("invalid IP address")
	}
	return []byte(ip.String()), nil
}

```

The MarshalText method in listing 5.26 has been declared using a value receiver of
type IP. A value receiver is exactly what you expect to see since you don’t share reference
type values. This also applies to passing reference type values as parameters to
functions and methods.



##### Listing 5.27 golang.org/src/net/ip.go: lines 318–325

```go
// ipEmptyString is like ip.String except that it returns
// an empty string when ip is unset.
func ipEmptyString(ip IP) string {
	if len(ip) == 0 {
		return ""
	}
	return ip.String()
}

```



In listing 5.27 you see the ipEmptyString function. This function is passed a value of
the type IP. Once again, you can see how the caller’s reference type value for this
parameter is not shared with the function. The function is passed a copy of the caller’s
reference type value. This also applies to return values. In the end, reference type values
are treated like primitive data values.



### 5.3.3 Struct types

Struct types can represent data values that could have either a primitive or nonprimitive
nature. When the decision is made that a struct type value should not be mutated
when something needs to be added or removed from the value, then it should follow
the guidelines for the built-in and reference types. Let’s start with looking at a struct
implemented by the standard library that has a primitive nature.



#### Listing 5.28 golang.org/src/time/time.go: lines 39–55

```go
type Time struct {
	// sec gives the number of seconds elapsed since
	// January 1, year 1 00:00:00 UTC.
	sec int64

	// nsec specifies a non-negative nanosecond
	// offset within the second named by Seconds.
	// It must be in the range [0, 999999999].
	nsec int32

	// loc specifies the Location that should be used to
	// determine the minute, hour, month, day, and year
	// that correspond to this Time.
	// Only the zero Time has a nil Location.
	// In that case it is interpreted to mean UTC.
	loc *Location
}
```

The Time struct in listing 5.28 comes from the time package. When you think about
time, you realize that any given point in time is not something that can change. This is
exactly how the standard library implements the Time type. Let’s look at the Now function
that creates values of type Time.

##### Listing 5.29 golang.org/src/time/time.go: lines 781–784

```go
func Now() Time {
	sec, nsec := now()
	return Time{sec + unixToInternal, nsec, Local}
}

```

The code in listing 5.29 shows the implementation of the Now function. This function
creates a value of type Time and returns a copy of that Time value back to the caller. A
pointer is not used to share the Time value created by the function. Next, let’s look at
a method declared against the Time type.

##### Listing 5.30 golang.org/src/time/time.go: lines 610–622

```go
func (t Time) Add(d Duration) Time {
	t.sec += int64(d / 1e9)
	nsec := int32(t.nsec) + int32(d%1e9)
	if nsec >= 1e9 {
		t.sec++
		nsec -= 1e9
	} else if nsec < 0 {
		t.sec--
		nsec += 1e9
	}
		t.nsec = nsec
	return t
}
```



The method Add in listing 5.30 is a great example of how the standard library treats
the Time type as having a primitive nature. The method is declared using a value
receiver and returns a new Time value. The method is operating on its own copy of the
caller’s Time value and returns a copy of its local Time value back to the caller. It’s up
to the caller whether they want to replace their Time value with what’s returned or
declare a new Time variable to hold the result.

In most cases, struct types don’t exhibit a primitive nature, but a nonprimitive one.
In these cases, adding or removing something from the value of the type should
mutate the value. When this is the case, you want to use a pointer to share the value
with the rest of the program that needs it. Let’s take a look at a struct type implemented
by the standard library that has a nonprimitive nature.



##### Listing 5.31 golang.org/src/os/file_unix.go: lines 15–29

###### 技巧

> 注: 这里引入了额外的间接层可以防止data 被客户端覆盖

```go
// File represents an open file descriptor.
type File struct { //这里的 file 的 data 被 copy 是不安全的,但是go有没有提供阻止其被拷贝的方式，所以这里采用了 嵌入 unexported 的 file 类型的指针，这样提供了额外的间接层来防止 copy.
	*file //注: 这里引入了额外的间接层可以防止data 被客户端覆盖
}

// file is the real representation of *File.
// The extra level of indirection ensures that no clients of os
// can overwrite this data, which could cause the finalizer
// to close the wrong file descriptor.
type file struct {
	fd int
	name string
	dirinfo *dirInfo // nil unless directory being read
	nepipe int32 // number of consecutive EPIPE in Write
}
```



In listing 5.31 you see the declaration of the File type from the standard library. The
nature of this type is nonprimitive. Values of this type are actually unsafe to be copied.
The comments for the unexported type make this clear. Since there’s no way to prevent
programmers from making copies, the implementation of the File type uses an
embedded pointer of an unexported type. We’ll talk about embedding types later in
this chapter, but this extra level of indirection provides protection from copies. Not
every struct type requires or should be implemented with this extra protection. Programmers
should respect the nature of each type and use it accordingly.

##### Listing 5.32 golang.org/src/os/file.go: lines 238–240

```go
func Open(name string) (file *File, err error) {
	return OpenFile(name, O_RDONLY, 0)
}

```



> 注: 当工厂函数返回一个指针时，其很好的表示了所返回的值的性质不是原始的。 
>
> The implementation of the Open function in listing 5.32 shows how a pointer is used
> to share File type values with the caller of the function. Open creates a value of type
>
> File and returns a pointer to that value. When a factory function returns a pointer,
> it’s a good indication that the nature of the value being returned is nonprimitive.
> Even if a function or method is never going to directly change the state of a
> nonprimitive value, it should still be shared.



##### Listing 5.33 golang.org/src/os/file.go: lines 224–232

```go
func (f *File) Chdir() error {
	if f == nil {
		return ErrInvalid
	}
	if e := syscall.Fchdir(f.fd); e != nil {
		return &PathError{"chdir", f.name, e}
	}
	return nil
}

```

The Chdir method in listing 5.33 shows how a pointer receiver is declared even
though no changes are made to the receiver value. Since values of type File have a
nonprimitive nature, they’re always shared and never copied.



###### 重要：采用 value receiver 还是 pointer receiver

> 决定是使用 value receiver 还是 pointer receiver 不应该基于 method 是否修改 receiving value 来判断，
>
> 而应该是基于类型的性质。当然，该指导规则的一个例外的情况是当你处理 interface values 
>
> 而你想要 value type receivers 提供的灵活性时。这种情况下，你可以使用 a value receiver 即使类型的特性
>
> 是非原始的。这完全基于接口值如何调用存储在其中的值的方法的背后机制。

The decision to use a value or pointer receiver should not be based on whether the
method is mutating the receiving value. The decision should be based on the nature
of the type. One exception to this guideline is when you need the flexibility that value
type receivers provide when working with interface values. In these cases, you may
choose to use a value receiver even though the nature of the type is nonprimitive. It’s
entirely based on the mechanics behind how interface values call methods for the values
stored inside of them. In the next section, you’ll learn about what interface values
are and the mechanics behind using them to call methods.



## 5.4 Interfaces



> Polymorphism is the ability to write code that can take on different behavior through
> the implementation of types. Once a type implements an interface, an entire world of
> functionality can be opened up to values of that type. The standard library is a great
> example of this. The io package provides an incredible set of interfaces and functions
> that make streaming data easy to apply to our code. Just by implementing two interfaces,
> we can take advantage of all the engineering behind the io package.
>
> But a lot of details go into declaring and implementing interfaces for use in our
> own programs. Even the implementation of existing interfaces requires an understanding
> of how interfaces work. Before we get into the details of how interfaces work
> and how to implement them, let’s look at a quick example of the use of interfaces
> from the standard library.



### 5.4.1 Standard library

Let’s start by looking at a sample program that implements a version of a popular program
named curl.

##### Listing 5.34 listing34.go

```go
// Sample program to show how to write a simple version of curl using
// the io.Reader and io.Writer interface support.
package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

// init is called before main.
func init() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: ./example2 <url>")
		os.Exit(-1)
	}
}

// main is the entry point for the application.
func main() {
	// Get a response from the web server.
	r, err := http.Get(os.Args[1]) //r 为 成功后 返回的 http.Request类型 的一个指针
	if err != nil {
		fmt.Println(err)
		return
	}

	// Copies from the Body to Stdout.
	io.Copy(os.Stdout, r.Body) //r.Body 为 io.ReadCloser 接口类型
	if err := r.Body.Close(); err != nil {
		fmt.Println(err)
	}
}
```



Listing 5.34 shows the power of interfaces and their use in the standard library. In a
few lines of code, we have a curl program by leveraging two functions that work with
interface values. On line 23, we call the Get function from the http package. The
http.Get function returns a pointer of type http.Request after it successfully communicates
with the server. The http.Request type contains a field named Body, which
is an interface value of type io.ReadCloser.

On line 30, the Body field is passed into the io.Copy function as the second parameter.
The io.Copy function accepts values of interface type io.Reader for its second
parameter, and this value represents a source of data to stream from. Luckily, the Body
field implements the io.Reader interface, so we can pass the Body field into io.Copy
and use a web server as our source.



The first parameter for io.Copy represents the destination and must be a value
that implements the io.Writer interface. For our destination, we pass a special interface
value from the os package called Stdout. This interface value represents the standard
out device and already implements the io.Writer interface. When we pass the
Body and Stdout values to the io.Copy function, the function streams data from the
web server to the terminal window in small chunks. Once the last chunk is read and
written, the io.Copy function returns.

The io.Copy function can perform this work flow for many different types that
already exist in the standard library.



##### Listing 5.35 listing35.go

```go
// Sample program to show how a bytes.Buffer can also be used
// with the io.Copy function.
package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
)

// main is the entry point for the application.
func main() {
    var b bytes.Buffer  //注: bytes.Buffer 实现了 io.Writer 接口，还实现了 io.Reader 接口

	// Write a string to the buffer.
	b.Write([]byte("Hello"))

	// Use Fprintf to concatenate a string to the Buffer.
	fmt.Fprintf(&b, "World!")

	// Write the content of the Buffer to stdout.
	io.Copy(os.Stdout, &b)
}
```



Listing 5.35 shows a program that uses interfaces to concatenate and then stream data
to standard out. On line 14, a variable of type Buffer from the bytes package is created,
and then the Write method is used on line 17 to add the string Hello to the buffer.
On line 20, the Fprintf function from the fmt package is called to append a
second string to the buffer.
The fmt.Fprintf function accepts an interface value of type io.Writer as its first
parameter. Since pointers of type bytes.Buffer implement the io.Writer interface,
it can be passed in and the fmt.Fprintf function performs the concatenation. Finally,
on line 23 the io.Copy function is used once again to write characters to the terminal
window. Since pointers of type bytes.Buffer also implement the io.Reader interface,
the io.Copy function can be used to display the contents of the buffer to the terminal
window.



These two small examples hopefully show you some of the benefits of interfaces
and how they’re used in the standard library. Next, let’s explore in greater detail how
interfaces are implemented.



### 5.4.2 Implementation



> 接口(Interfaces ) 仅声明行为。这些行为永远不会被 接口直接实现，而是通过 用于定义的 methods 实现。
>
> 当 用于定义的类型实现了 接口声明的那套 methods 时，用于定义类型的 value 就能被赋给 接口类型(interface type)
>
> 的value.这种赋值会将 用于定义类型的 value 存储到 接口的  value 中。
>
> Interfaces are types that just declare behavior. This behavior is never implemented by
> the interface type directly but instead by user-defined types via methods. When a userdefined
> type implements the set of methods declared by an interface type, values of
> the user-defined type can be assigned to values of the interface type. This assignment
> stores the value of the user-defined type into the interface value.



>实现了接口的用户自定义类型在这种 实现关系中被称为 具体类型(concrete type) .
>
>If a method call is made against an interface value, the equivalent method for the
>stored user-defined value is executed. Since any user-defined type can implement any
>interface, method calls against an interface value are polymorphic in nature. The userdefined
>type in this relationship is often called a concrete type, since interface values have
>no concrete behavior without the implementation of the stored user-defined value.



> 方法集: method sets
>
> There are rules around whether values or pointers of a user-defined type satisfy the
> implementation of an interface. Not all values are created equal. These rules come
> from the specification under the section called method sets. Before you begin to
> investigate the details of method sets, it helps to understand what interface type values
> look like and how user-defined type values are stored inside them.





> Figure 5.1 A simple view of an
> interface value after concrete
> type value assignment  (注: 该图对于理解 interface 的赋值非常重要)
>
> 
>
> interface 底层内部包含两个(two-word)数据结构：即指向 被称为 iTable(内部表)的指针，其包含了关于被存储的值的类型信息,
>
> iTable 包含了 类型信息(如Type(user)) 以及与其 value 关联的 methods 的列表。
>
> 而第二个数据结构就是 指向被存储的值的指针。类型信息和指针的组合绑定了两个值之间的关系
>
> 
>
> In figure 5.1 you see what the value of the interface variable looks like after the
> assignment of the user type value. Interface values are two-word data structures. The
> first word contains a pointer to an internal table called an iTable, which contains type
> information about the stored value. The iTable contains the type of value that has
> been stored and a list of methods associated with the value. The second word is a
> pointer to the stored value. The combination of type information and pointer binds
> the relationship between the two values.





> Figure 5.1 A simple view of an
> interface value after concrete
> type value assignment   (注: 该图对于理解 interface 的赋值非常重要)
>
> 
>
> Figure 5.2 shows what happens when a pointer is assigned to an interface value.
> In this case, the type information will reflect that a pointer of the assigned type has
> been stored, and the address being assigned is stored in the second word of the
> interface value.





### 5.4.3 Method sets



> 方法集:
>
> Method sets define the rules around interface compliance. Take a look at the following
> code to help you understand how method sets play an important role with interfaces.

##### Listing 5.36 listing36.go

```go
// Sample program to show how to use an interface in Go.
package main

import (
	"fmt"
)

// notifier is an interface that defined notification
// type behavior.
type notifier interface {
	notify()
}

// user defines a user in the program.
type user struct {
	name  string
	email string
}

// notify implements a method with a pointer receiver.
func (u *user) notify() {
	fmt.Printf("Sending user email to %s<%s>\n",
		u.name,
		u.email)
}

// main is the entry point for the application.
func main() {
	// Create a value of type User and send a notification.
	u := user{"Bill", "bill@email.com"}

	sendNotification(u)

	// ./listing36.go:32: cannot use u (type user) as type
	//                     notifier in argument to sendNotification:
	//   user does not implement notifier
	//                          (notify method has pointer receiver)
}

// sendNotification accepts values that implement the notifier
// interface and sends notifications.
func sendNotification(n notifier) {
	n.notify()
}
```



> 重要:
>
> Method sets 定义了关联到指定类型 的 values 或 pointers 的一组 methods. 
>
> 而 receiver 的 type 被用于确定 a method 是否被关联到了 a value, pointer 或 both
>
> 
>
> To understand why values of type user don’t implement the interface when an interface
> is implemented with a pointer receiver, you need to understand what method sets
> are. Method sets define the set of methods that are associated with values or pointers
> of a given type. The type of receiver used will determine whether a method is associated
> with a value, pointer, or both.



> Let’s start with explaining the rules for method sets as it’s documented by the Go
> specification.



##### Listing 5.42 Method sets as described by the specification

| Values | Methods Receivers |
| ------ | ----------------- |
| T      | (t T)             |
| *T     | (t T) and (t *T)  |

Listing 5.42 shows how the specification describes method sets. It says that a value of
type T only has methods declared that have a value receiver, as part of its method set.
But pointers of type T have methods declared with both value and pointer receivers, as

part of its method set. Looking at these rules from the perspective of the value is confusing.
Let’s look at these rules from the perspective of the receiver.

##### Listing 5.43 Method sets from the perspective of the receiver type

| Methods Receivers | Values   |
| ----------------- | -------- |
| (t T)             | T and *T |
| (t *T)            | *T       |

Listing 5.43 shows the same rules, but from the perspective of the receiver. It says that
if you implement an interface using a pointer receiver, then only pointers of that type
implement the interface. If you implement an interface using a value receiver, then
both values and pointers of that type implement the interface. If you look at the code
in listing 5.36 again, you now have the context to understand the compiler error.



##### Listing 5.45 listing36.go: lines 28–35

```go
func main() {
	// Create a value of type User and send a notification.
	u := user{"Bill", "bill@email.com"}

	sendNotification(&u)

	// PASSED THE ADDRESS AND NO MORE ERROR.
}
```



In listing 5.45, we now have a program that compiles and runs. Only pointers of type
user can be passed to the sendNotification function, since a pointer receiver was
used to implement the interface.



> 为什么会有这样的限制呢?
>
> 答案就是 事实上 并不能总是能够获取到 a value 的 地址(address )
>
> The question now is why the restriction? The answer comes from the fact that it’s
> not always possible to get the address of a value.



##### Listing 5.46 listing46.go

```go
// Sample program to show how you can't always get the
// address of a value.
package main

import "fmt"

// duration is a type with a base type of int.
type duration int

// format pretty-prints the duration value.
func (d *duration) pretty() string {
	return fmt.Sprintf("Duration: %d", *d)
}

// main is the entry point for the application.
func main() {
	duration(42).pretty() //此处传递的实参 42 并不是变量，因为 duration 也就无法获取到其地址

	// ./listing46.go:17: cannot call pointer method on duration(42)
	// ./listing46.go:17: cannot take the address of duration(42)
}
```

The code in listing 5.46 attempts to get the address of a value of type duration and
can’t. This shows that it’s not always possible to get the address of a value. Let’s look at
the method set rules again.



Because it’s not always possible to get the address of a value, the method set for a value
only includes methods that are implemented with a value receiver.



### 5.4.4 Polymorphism

Now that you understand the mechanics behind interfaces and method sets, let’s look
at one final example that shows the polymorphic behavior of interfaces.

##### Listing 5.48 listing48.go

```go
// Sample program to show how polymorphic behavior with interfaces.
package main

import (
	"fmt"
)

// notifier is an interface that defines notification
// type behavior.
type notifier interface {
	notify()
}

// user defines a user in the program.
type user struct {
	name  string
	email string
}

// notify implements the notifier interface with a pointer receiver.
func (u *user) notify() {
	fmt.Printf("Sending user email to %s<%s>\n",
		u.name,
		u.email)
}

// admin defines a admin in the program.
type admin struct {
	name  string
	email string
}

// notify implements the notifier interface with a pointer receiver.
func (a *admin) notify() {
	fmt.Printf("Sending admin email to %s<%s>\n",
		a.name,
		a.email)
}

// main is the entry point for the application.
func main() {
	// Create a user value and pass it to sendNotification.
	bill := user{"Bill", "bill@email.com"}
	sendNotification(&bill)

	// Create an admin value and pass it to sendNotification.
	lisa := admin{"Lisa", "lisa@email.com"}
	sendNotification(&lisa)
}

// sendNotification accepts values that implement the notifier
// interface and sends notifications.
func sendNotification(n notifier) {
	n.notify()
}
```

In listing 5.48, we have a final example of how interfaces provide polymorphic behavior.
On line 10, we have the same notifier interface that we declared in previous listings.
Then on lines 15 through 25, we have the declaration of a struct named user
with the implementation of the notifier interface using a pointer receiver. On lines
28 through 38, we have the declaration of a struct named admin with the implementation
of the notifier interface as well. We have two concrete types implementing the
notifier interface.
On line 53, we have our polymorphic sendNotification function again that
accepts values that implement the notifier interface. Since any concrete type value
can implement the interface, this function can execute the notify method for any
concrete type value that’s passed in, thus providing polymorphic behavior.

Finally, in listing 5.49 you see it all come together. A value of type user is created on
line 43 in the main function, and then the address of that value is passed into send-
Notification on line 44. This causes the notify method declared by the user type to
be executed. Then we do the same with a value of type admin on lines 47 and 48. In
the end, because sendNotification accepts interface values of type notifier, the
function can execute the behavior implemented by both user and admin.



## 5.5 Type embedding



> 既有代码复用(reuse) 和 修改(change)
>
> 类型嵌入: 将 inner type 嵌入到 outer type 中。
>
> 
>
> Go allows you to take existing types and both extend and change their behavior. This
> capability is important for code reuse and for changing the behavior of an existing
> type to suit a new need. This is accomplished through type embedding. It works by
> taking an existing type and declaring that type within the declaration of a new struct
> type. The type that is embedded is then called an inner type of the new outer type.



> 通过  inner type 的提升， inner type 中的标识符会被提升到  outer type中。
>
> 这些被提升的标识符就成了 outer type 的一部分，就如同 这些标识符是显示地在 outer type 
>
> 声明的一样。从而 outer type 就是由  inner type 中的 everything 组成的，同时 还可以添加
>
> 新的 字段(fields) and 方法(methods). outer type 还能够声明其与  inner type 相同的标识符并覆盖如何
>
> 需要覆盖的 任意字段和方法。就是是 既有类型被扩展和修改的方式。
>
> Through inner type promotion, identifiers from the inner type are promoted up
> to the outer type. These promoted identifiers become part of the outer type as if they
> were declared explicitly by the type itself. The outer type is then composed of everything
> the inner type contains, and new fields and methods can be added. The outer
>
> type can also declare the same identifiers as the inner type and override any fields or
> methods it needs to. This is how an existing type can be both extended and changed.
>
> Let’s start with a sample program that shows the basics of type embedding.

##### Listing 5.50 listing50.go

```go
// Sample program to show how to embed a type into another type and
// the relationship between the inner and outer type.
package main

import (
	"fmt"
)

// user defines a user in the program.
type user struct {
	name  string
	email string
}

// notify implements a method that can be called via
// a value of type user.
func (u *user) notify() {
	fmt.Printf("Sending user email to %s<%s>\n",
		u.name,
		u.email)
}

// admin represents an admin user with privileges.
type admin struct {
    user  // Embedded Type //嵌入一个 既有的类型(inner type),
	level string
}

// main is the entry point for the application.
func main() {
	// Create an admin user.
	ad := admin{
		user: user{ //为了访问 inner type, 这里只需要 type's name
			name:  "john smith",
			email: "john@yahoo.com",
		},
		level: "super",
	}

	// We can access the inner type's method directly.
	ad.user.notify() //通过outer type 直接访问 inner type 访问调用 inner type 的 notify 方法。inner type 总是存在且可以被访问的。

	// The inner type's method is promoted.
	ad.notify() //而因为 inner type promotion 机制，notify 还可以直接通过 outer type 访问
}
```

On line 10 in listing 5.51, we have the declaration of a struct type named user, and
then on line 24 we have the declaration of a second struct type named admin. Inside
the declaration of the admin type on line 25, we have the embedding of the user type
as an inner type of admin. To embed a type, all that needs to happen is for the type
name to be declared. One line 26, we have the declaration of a field named level.
Notice the difference between declaring a field and embedding a type.

Once we embed the user type inside of admin, we can say that user is an inner type
of the outer type admin. The concept of having an inner and outer type makes it easier
to understand the relationship between the two.



Listing 5.52 shows the declaration of a method named notify using a pointer receiver
of type user. The method just displays a friendly message stating an email is being sent
to a specific user and email address. Now let’s look at the main function.



The main function in listing 5.53 shows the mechanics behind type embedding. On
line 32, a value of type admin is created. The initialization of the inner type is performed
using a struct literal, and to access the inner type we just need to use the type’s
name. Something special about an inner type is that it always exists in and of itself.
This means the inner type never loses its identity and can always be accessed directly.



> On line 41 in listing 5.54, you see a call to the notify method. This call is made by accessing
> the user inner type directly through the admin outer type variable ad. This shows
> how the inner type exists in and of itself and is always accessible. But thanks to inner type
> promotion, the notify method can also be accessed directly from the ad variable.



Listing 5.55 on line 44 shows the method call to notify from the outer type variable.
Since the identifiers of the inner type are promoted up to the outer type, we can
access the inner type's identifiers through values of the outer type. Let’s change the
sample by adding an interface.

##### Listing 5.56 listing56.go

```go
// Sample program to show how embedded types work with interfaces.
package main

import (
	"fmt"
)

// notifier is an interface that defined notification
// type behavior.
type notifier interface {
	notify()
}

// user defines a user in the program.
type user struct {
	name  string
	email string
}

// notify implements a method that can be called via
// a value of type user.
func (u *user) notify() {
	fmt.Printf("Sending user email to %s<%s>\n",
		u.name,
		u.email)
}

// admin represents an admin user with privileges.
type admin struct {
	user
	level string
}

// main is the entry point for the application.
func main() {
	// Create an admin user.
	ad := admin{
		user: user{
			name:  "john smith",
			email: "john@yahoo.com",
		},
		level: "super",
	}

	// Send the admin user a notification.
	// The embedded inner type's implementation of the
	// interface is "promoted" to the outer type.
	sendNotification(&ad)
}

// sendNotification accepts values that implement the notifier
// interface and sends notifications.
func sendNotification(n notifier) {
	n.notify()
}
```



This is where things get interesting. On line 37 in listing 5.58, we create the admin
outer type variable ad. Then on line 48, we pass the address of the outer type variable
to the sendNotification function. The compiler accepts the assignment of the outer
type pointer as a value that implements the notifier interface. But if you look at the
entire sample program, you won’t see the admin type implement the interface.
Thanks to inner type promotion, the implementation of the interface by the inner
type has been promoted up to the outer type. That means the outer type now implements
the interface, thanks to the inner type’s implementation. When we run this
sample program, we get the following output.



> What if the outer type doesn’t want to use the inner type’s implementation because
> it needs an implementation of its own? Let’s look at another sample program that
> solves that problem.

##### Listing 5.60 listing60.go

```go
// Sample program to show what happens when the outer and inner
// type implement the same interface.
package main

import (
	"fmt"
)

// notifier is an interface that defined notification
// type behavior.
type notifier interface {
	notify()
}

// user defines a user in the program.
type user struct {
	name  string
	email string
}

// notify implements a method that can be called via
// a value of type user.
func (u *user) notify() {
	fmt.Printf("Sending user email to %s<%s>\n",
		u.name,
		u.email)
}

// admin represents an admin user with privileges.
type admin struct {
	user
	level string
}

// notify implements a method that can be called via
// a value of type Admin.
func (a *admin) notify() {
	fmt.Printf("Sending admin email to %s<%s>\n",
		a.name,
		a.email)
}

// main is the entry point for the application.
func main() {
	// Create an admin user.
	ad := admin{
		user: user{
			name:  "john smith",
			email: "john@yahoo.com",
		},
		level: "super",
	}

	// Send the admin user a notification.
	// The embedded inner type's implementation of the
	// interface is NOT "promoted" to the outer type.
	sendNotification(&ad) //此处调用的是 outer type 自己直接版本的 method

	// We can access the inner type's method directly.
	ad.user.notify()  //当 outer type 的 同名 method 被定义了，则inner type 中的同名method不会被提升，但其仍然存在。代码仍然可以通过此种方式来访问。

	// The inner type's method is NOT promoted.
	ad.notify() //此处调用的是 outer type 自己直接版本的 method
}

// sendNotification accepts values that implement the notifier
// interface and sends notifications.
func sendNotification(n notifier) {
	n.notify()
}
```



This code sample adds an implementation of the notifier interface by the admin type.
When the admin type’s implementation is called, it will display "Sending admin email"
as opposed to the user type’s implementation that displays "Sending user email".

There are some more changes to the main function as well.





On line 46 in listing 5.62, we have the creation of the outer type ad variable again.
On line 57 the address of the ad variable is passed to the sendNotification function,
and the value is accepted as implementing the interface. On line 60 the code calls
the notify method from accessing the user inner type directly. Finally, on line 63 the
notify method is called using the outer type variable ad. When you look at the output
of this sample program, you see a different story.



This time you see how the admin type’s implementation of the notifier interface
was executed both by the sendNotification function and through the use of the
outer type variable ad. This shows how the inner type’s implementation was not promoted
once the outer type implemented the notify method. But the inner type is
always there, in and of itself, so the code is still able to call the inner type’s implementation
directly.





## 5.6 Exporting and unexporting identifiers

public(公共) 和 default (package)



> 标志符的 显隐性 能力 是 好的 API 设计的关键。go 通过支持 包中 exporting 和unexporting 
>
> 的标志符来提供该特性。
>
> The ability to apply visibility rules to the identifiers you declare is critical for good API
> design. Go supports the exporting and unexporting of identifiers from a package to
> provide this functionality. In chapter 3, we talked about packaging and how to import
> the identifiers from one package into another. Sometimes, you may not want identifiers
> such as types, functions, or methods to be a part of the public API for a package. In
> these cases, you need a way to declare those identifiers so they’re unknown outside
> the package. You need to declare them to be unexported.



Let’s start with a sample program that shows how to unexport identifiers from a
package.



##### Listing 5.64 listing64/

```go
  
// Sample program to show how the program can't access an
// unexported identifier from another package.
package main

import (
	"fmt"

	"github.com/goinaction/code/chapter5/listing64/counters"
)

// main is the entry point for the application.
func main() {
	// Create a variable of the unexported type and initialize
	// the value to 10.
	counter := counters.alertCounter(10) //error, 无法直接引用其他包中 unexported 的 标识符

	// ./listing64.go:15: cannot refer to unexported name
	//                                         counters.alertCounter
	// ./listing64.go:15: undefined: counters.alertCounter

	fmt.Printf("Counter: %d\n", counter)
}
```



> counters/counters.go

```go
// Package counters provides alert counter support.
package counters //最佳实践: 声明的包的名称最好和其所在目录的名称一致。

// alertCounter is an unexported type that
// contains an integer counter for alerts.
type alertCounter int //自定义类型 alertCounter, 其 base type 为 int
```



> 当标识符以 一个小写字母开头 时，则其实 是unexported  的或 对包之外的 code 是不知道的。
>
> 而当标识符以 一个大写字母开头 时，则其实 是exported  的或 对包之外的 code 是知道的。
>
> When an identifier starts with a lowercase letter, the identifier is unexported or
> unknown to code outside the package. When an identifier starts with an uppercase letter,
> it’s exported or known to code outside the package. Let’s look at the code that
> imports this package.



##### Listing 5.69 counters/counters.go

```go
// Package counters provides alert counter support.
package counters

// alertCounter is an unexported type that
// contains an integer counter for alerts.
type alertCounter int

// New creates and returns values of the unexported
// type alertCounter.
func New(value int) alertCounter { // exported 的工厂方法，Go中的惯例是为共产函数命名为 New
	return alertCounter(value)
}

```



Listing 5.69 shows the changes we made to the counters package. The alertCounter
type is still unexported, but now on line 10 we have a function called New. It’s a convention
in Go to give factory functions the name of New. This New function does something
interesting: it creates a value of the unexported type and returns that value back
to the caller. Let’s look at the main function from listing68.go.



##### Listing 5.70 listing68.go

```go
// main is the entry point for the application.
func main() {
	// Create a variable of the unexported type using the exported
	// New function from the package counters.
	counter := counters.New(10)

	fmt.Printf("Counter: %d\n", counter)
}
```



On line 15 in listing 5.70, you see a call to the New function from the counters package.
The value returned by the New function is then assigned to a variable named
counter. This program compiles and runs, but why? The New function is returning a
value of the unexported type alertCounter, yet main is able to accept that value and
create a variable of the unexported type.

> 注: 
>
> 1.标识符 是 分为 exported  或 unexported 的，但是这不适用于 value.
>
> 2. 简短的变量声明标识符 :=  具有类型推断的能力 且 可被用于 创建 unexported type 的一个变量。
>
>    你永远无法显示(明确指明)地创建一个 unexported type 的变量，但是 变量声明操作符 := 可以。
>
> This is possible for two reasons. First, identifiers are exported or unexported, not
> values. Second, the short variable declaration operator is capable of inferring the type
> and creating a variable of the unexported type. You can never explicitly create a variable
> of an unexported type, but the short variable declaration operator can.
> Let’s look at a new sample program that shows how fields from a struct type are
> affected by these visibility rules.



listing71/listing71.go

```go
// Sample program to show how unexported fields from an exported
// struct type can't be accessed directly.
package main

import (
	"fmt"

	"github.com/goinaction/code/chapter5/listing71/entities"
)

// main is the entry point for the application.
func main() {
	// Create a value of type User from the entities package.
	u := entities.User{
		Name:  "Bill",
        email: "bill@email.com", //error, 因为 email 是其他包中的 unexported 的
	}

	// ./example71.go:16: unknown entities.User field 'email' in
	//                    struct literal

	fmt.Printf("User: %v\n", u)
}
```



entities/entities.go

```go
// Package entities contains support for types of
// people in the system.
package entities

// User defines a user in the program.
type User struct {
	Name  string  //注; 此处 Name 是 exported 的
    email string  //注: 此处 email 是 unexported 的
}
```



The entities package is imported on line 08 in listing 5.73. On line 14 a variable
named u of the exported type User from the entities package is declared and its
fields initialized. But there’s a problem. On line 16 the code attempts to initialize the
unexported field email, and the compiler complains the field is unknown. That identifier
can’t be accessed outside the entities package, since it has been unexported.



Let’s look at one final example to show how the exporting and unexporting of
embedded types work.



##### Listing 5.74 listing74/

entities/entities.go

```go
// Package entities contains support for types of
// people in the system.
package entities

// user defines a user in the program.
type user struct {
	Name  string
	Email string
}

// Admin defines an admin in the program.
type Admin struct {
	user   // The embedded type is unexported.
	Rights int
}
```



listing74.go

```go
// Sample program to show how unexported fields from an exported
// struct type can't be accessed directly.
package main

import (
	"fmt"

	"github.com/goinaction/code/chapter5/listing74/entities"
)

// main is the entry point for the application.
func main() {
	// Create a value of type Admin from the entities package.
	a := entities.Admin{
		Rights: 10,
	}

	// Set the exported fields from the unexported
	// inner type.
	a.Name = "Bill"
	a.Email = "bill@email.com"

	fmt.Printf("User: %v\n", a)
}
```



On line 06 in listing 5.75, an unexported struct type named user is declared. It contains
two exported fields named Name and Email. On line 12 an exported struct type
named Admin is declared. Admin has an exported field named Rights, but it also
embeds the unexported user type. Let’s look at the code in the main function for
listing74.go.



The main function starts out on line 14 in listing 5.76 by creating a value of type Admin
from the entities package. Since the user inner type is unexported, this code can’t
access the inner type to initialize it inside the struct literal. Even though the inner type
is unexported, the fields declared within the inner type are exported. Since the identifiers
from the inner type are promoted to the outer type, those exported fields are
known through a value of the outer type.
Therefore, on line 20 and 21 the Name and Email fields from the unexported inner
type can be accessed and initialized through the outer type variable a. There’s no
access to the inner type directly, since the user type is unexported.



# Concurrency



> 通常一个程序被编写成为 按 code 的线性路径来执行单个任务并结束。如果可能的话，
>
> 应该总是这么做，因为这种程序 通常 编写简单并更好维护。但是某些时候并行地执行多个任务会
>
> 很有好处。例如 web 服务。
>
> 并行 的支持(support for concurrency) 是被直接构建进 Go 语言和 runtime 中的。
>
> Often a program can be written as one linear path of code that performs a single
> task and finishes. When this is possible, always choose this option, because this type
> of program is usually simple to write and maintain. But there are times when executing
> multiple tasks concurrently has greater benefit. One example is with a web
> service that can receive multiple requests for data on individual sockets at the same
> time. Each socket request is unique and can be independently processed from any
> other. Having the ability to execute requests concurrently can dramatically improve
> the performance of this type of system. With this in mind, support for concurrency
> has been built directly into Go’s language and runtime.





> Go 中的 Concurrency  指的是 functions  的可以彼此独立 运行(run) 的能力。
>
> 当一个函数(function ) 被创建为 goroutine 时，则其被视为 一个被调度的，
>
> 其之后在可用的 一个 逻辑处理器上执行的独立的软件单元。
>
> Go运行时调度器是一种复杂的软件片段，其可以管理所有
> 创建的goroutine和需要处理器时间。
>
> scheduler 处于操作系统的顶部，其将 操作系统的线程绑定到 逻辑处理器上。
>
> 而这些逻辑处理器有轮流执行  goroutines.
>
> 调度程序可控制与在任何给定时间在哪个逻辑处理器上运行哪些goroutine有关的所有事情。
>
> 
>
> Concurrency in Go is the ability for functions to run independent of each other.
> When a function is created as a goroutine, it’s treated as an independent unit of
> work that gets scheduled and then executed on an available logical processor.
> The Go runtime scheduler is a sophisticated piece of software that manages all
> the goroutines that are created and need processor time. The scheduler sits on
>
> top of the operating system, binding operating system’s threads to logical processors
> which, in turn, execute goroutines. The scheduler controls everything related to
> which goroutines are running on which logical processors at any given time.



> 并发同步来自称为通信顺序处理或CSP的范例. CSP 是一种消息传递模型。其采用的是
>
> goroutines 之间的数据传递而非加锁数据来实现同步访问。而在 goroutines  之间通过和传递消息
>
> 的关键的数据结构被称为 a channel(管道). 
>
> 使用 channels 可以使编写 并发程序更加容易且不那么容易犯错。
>
> Concurrency synchronization comes from a paradigm called communicating sequential
> processes or CSP. CSP is a message-passing model that works by communicating data
> between goroutines instead of locking data to synchronize access. The key data type
> for synchronizing and passing messages between goroutines is called a channel. For
> many developers who have never experienced writing concurrent programs using
> channels, they invoke an air of awe and excitement, which you hopefully will experience
> as well. Using channels makes it easier to write concurrent programs and makes
> them less prone to errors.



## 6.1 Concurrency versus parallelism

> 并发与并行
>
> 理解 系统进程 和 线程 的相关知识 可以帮助我们后续 理解 Go runtime scheduler 是如何
>
> 与 操作系统一起工作来 并发地运行 goroutines  的。
>
> 进程就是为完成特定任务(task)而运行着的程序。你可以将 进程理解为类似 持有 一个应用程序
>
> 运行时 使用和维护的 所有的资源(resources)的一个容器。
>
> Let’s start by learning at a high level what operating system processes and threads are.
> This will help you understand later on how the Go runtime scheduler works with the
> operating system to run goroutines concurrently. When you run an application, such
> as an IDE or editor, the operating system starts a process for the application. You can
> think of a process like a container that holds all the resources an application uses and
> maintains as it runs.



> Figure 6.1 A simple view of a process and its threads for a running application
>
> 线程是操作系统安排的执行路径，用于运行您在函数中编写的代码。
>
> 每个进程都包含了至少一个线程，并且 初始化线程(initial thread) 通常被称为主线程(main thread)。
>
> 当主线程终止了， 该应用程序也就终止了,因为此执行路径是应用程序的起源(origin )。
>
> 操作系统计划调度线程在处理器上运行，而不管它们属于哪个进程。
>
> 不同的操作系统用来调度线程的算法总是在变化，并从程序员那里抽象了出来。
>
> Figure 6.1 shows a process that contains common resources that may be allocated
> by any process. These resources include but are not limited to a memory address
> space, handles to files, devices, and threads. A thread is a path of execution that’s
> scheduled by the operating system to run the code that you write in your functions.
> Each process contains at least one thread, and the initial thread for each process is
> called the main thread. When the main thread terminates, the application terminates,
> because this path of the execution is the origin for the application. The operating system
> schedules threads to run against processors regardless of the process they belong
> to. The algorithms that different operating systems use to schedule threads are always
> changing and abstracted from the programmer.



> 操作系统是针对物理的处理器来调度线程的运行，
>
> 而 Go runtime 是针对 逻辑的处理器(logical processors)来调度 goroutines 的运行。
> 每个逻辑处理机是被独立地绑定到单个的操作系统线程上的。从1.5版开始，
> 默认是为每个可用的物理处理器分配一个逻辑处理器。
>
> 这些逻辑处理器用于执行所有创建的goroutine。
>
> 即使使用单个逻辑处理器，也可以调度成千上万个goroutine以惊人的效率和性能同时运行。
>
> The operating system schedules threads to run against physical processors and the
> Go runtime schedules goroutines to run against logical processors. Each logical processor
> is individually bound to a single operating system thread. As of version 1.5, the
> default is to allocate a logical processor for every physical processor that’s available.
> Prior to version 1.5, the default was to allocate only a single logical processor. These
> logical processors are used to execute all the goroutines that are created. Even with a
> single logical processor, hundreds of thousands of goroutines can be scheduled to run
> concurrently with amazing efficiency and performance.



> Figure 6.2 How the Go scheduler manages goroutines
>
> 通过图6.2 可以了解到 操作系统线程、逻辑处理器与 本地运行队列的关系。
>
> 当 goroutines 被创建且准备被运行时，这些 goroutines  
>
> 会被置于 (go runtime) scheduler 的全局运行队列中。过一会，这些 goroutines 会被分配一个逻辑处理器
>
> 且被放置进 该逻辑处理器的 本地运行队列中。从那里开始，goroutine等待轮到其被逻辑处理器执行。
>
> In figure 6.2, you can see the relationship between an operating system thread, a
> logical processor, and the local run queue. As goroutines are created and ready to
> run, they’re placed in the scheduler’s global run queue. Soon after, they’re assigned
> to a logical processor and placed into a local run queue for that logical processor.
> From there, a goroutine waits its turn to be given the logical processor for execution.





> 有时 运行着的 goroutine  可能需要执行 具有阻塞的系统调用。例如打开一个文件。
>
> 当这种情况发生时，则该 thread 和 goroutine  会被从逻辑处理器上分离下来，然后该 thread 
>
> 继续在等待 其 syscall 返回的时候阻塞。与此同时，就 逻辑处理器上就没有 thread 了。
>
> 因此调度器就会创建一个新的进程并将其附加到该 逻辑处理器上。
>
> 然后调度器(go runtime scheduler)就会从本地运行队列中选取另一个 goroutine 来执行。
>
> 一旦 系统调用返回了，则 goroutine  会被放置回 本地运行队列中，而 该 thread 会被放置到一边
>
> 以备将来使用。
>
> Sometimes a running goroutine may need to perform a blocking syscall, such as opening
> a file. When this happens, the thread and goroutine are detached from the logical
> processor and the thread continues to block waiting for the syscall to return. In the
> meantime, there’s a logical processor without a thread. So the scheduler creates a new
> thread and attaches it to the logical processor. Then the scheduler will choose
> another goroutine from the local run queue for execution. Once the syscall returns,
> the goroutine is placed back into a local run queue, and the thread is put aside for
> future use.



> 如果 a goroutine 需要执行  a network I/O 调用，则其处理会有点不同。
>
> 在这种情况下，the goroutine 会从 逻辑处理器上分离下来并移入到 the runtime 集成的
>
> 网络轮询器(network poller)中。一旦该 poller 指出 一个 读 或 写操作 已经准备就绪，则
>
>  the goroutine 会被派发回 一个逻辑处理器中 以处理该操作。
>
> 调度程序中没有对可创建的逻辑处理器数量的限制。
>
> 但是默认情况下，the runtime 将每个程序限制为最多10,000个线程。
>
> 可以通过 调用 runtime/debug 包中的 SetMaxThreads 函数来更改此值。
>
> 如果任何程序尝试使用更多线程，则该程序将崩溃。
>
> If a goroutine needs to make a network I/O call, the process is a bit different. In
> this case, the goroutine is detached from the logical processor and moved to the runtime
> integrated network poller. Once the poller indicates a read or write operation is
> ready, the goroutine is assigned back to a logical processor to handle the operation.
> There’s no restriction built into the scheduler for the number of logical processors
> that can be created. But the runtime limits each program to a maximum of 10,000
> threads by default. This value can be changed by calling the SetMaxThreads function
> from the runtime/debug package. If any program attempts to use more threads, the
> program crashes.



> 并发(Concurrency )不是并行(parallelism)。并行(parallelism)仅当在 多个 code 片段(pieces ) 
>
> 同时执行在不同的物理处理器上时才能实现。
>
> 并行是关于一次做很多事情。并发就是一次管理很多事情。
>
> 在许多情况下，并发性能可能优于并行性,因为其在操作系统和硬件上的压力要小得多，这可以使系统做更多的事情
>
>  这 less-is-more 的哲学是该语言的咒语。
>
> Concurrency is not parallelism. Parallelism can only be achieved when multiple
> pieces of code are executing simultaneously against different physical processors. Parallelism
> is about doing a lot of things at once. Concurrency is about managing a lot of
> things at once. In many cases, concurrency can outperform parallelism, because the
> strain on the operating system and hardware is much less, which allows the system to
> do more. This less-is-more philosophy is a mantra of the language.



> 如果你想并行(parallel)地运行goroutines , 则你必须使用两个以上的逻辑处理器。
>
> 当存在多个逻辑处理器的时候，调度器(go runtime scheduler)可以在 这些逻辑处理器之间平均分配goroutines 。
>
> 这将导致 goroutines  运行在不同的线程上。但是如果要实现真实的并行(parallelism),你仍然需要
>
> 将你的程序运行在具有多个物理处理器的机器上。
>
> 如果没有，那么即使Go runtime 正在使用多个线程，goroutine程序也将在单个物理处理器上同时运行。
>
> If you want to run goroutines in parallel, you must use more than one logical processor.
> When there are multiple logical processors, the scheduler will evenly distribute
> goroutines between the logical processors. This will result in goroutines running on
> different threads. But to have true parallelism, you still need to run your program on
> a machine with multiple physical processors. If not, then the goroutines will be running
> concurrently against a single physical processor, even though the Go runtime is
> using multiple threads.



> Figure 6.3 Difference between concurrency and parallelism
>
> 建议不要盲目更改逻辑处理器的 runtime 默认值。
>
> 调度程序包含智能算法，可随着Go的每个发行版进行更新和改进。
>
> 如果您发现可能会遇到的性能问题
> 通过更改逻辑处理器的数量来解决问题，您就可以这样做。
>
> Figure 6.3 shows the difference between running goroutines concurrently against
> a single logical processor and concurrently in parallel against two logical processors.
> It’s not recommended to blindly change the runtime default for a logical processor.
> The scheduler contains intelligent algorithms that are updated and improved with
> every release of Go. If you’re seeing performance issues that you believe could be
> resolved by changing the number of logical processors, you have the ability to do so.
> You’ll learn more about this soon.
>



## 6.2 Goroutines

> Let’s uncover more about the behavior of the scheduler and how to create goroutines
> and manage their lifespan. We’ll start with samples that run using a single logical processor
> before discussing how to run goroutines in parallel. Here’s a program that creates
> two goroutines that display the English alphabet with lower and uppercase letters
> in a concurrent fashion.



##### Listing 6.1 listing01.go

```go
// This sample program demonstrates how to create goroutines and
// how the scheduler behaves.
package main

import (
	"fmt"
	"runtime"
	"sync"
)

// main is the entry point for all Go programs.
func main() {
	// Allocate 1 logical processor for the scheduler to use.
	runtime.GOMAXPROCS(1) //修改设置 go runtime scheduler 可用的逻辑处理器的个数为 1.即该程序使用a single logical processor

	// wg is used to wait for the program to finish.
	// Add a count of two, one for each goroutine.
	var wg sync.WaitGroup //A WaitGroup 是一个计数信号量，其能够被用于维持 正在运行的 goroutines 的记录。当  a WaitGroup 的值大于 0 时，则 该 Wait 方法发生阻塞。
	wg.Add(2)

	fmt.Println("Start Goroutines")

	// Declare an anonymous function and create a goroutine.
	go func() {
		// Schedule the call to Done to tell main we are done.
        defer wg.Done()  //在 defer 语句中对信号量 执行 decrement 操作(defer 能保证其在该匿名函数 return 时总是能得到执行)

		// Display the alphabet three times
		for count := 0; count < 3; count++ {
			for char := 'a'; char < 'a'+26; char++ {
				fmt.Printf("%c ", char)
			}
		}
	}()

	// Declare an anonymous function and create a goroutine.
	go func() { //使用关键字 go 将这个匿名的 函数创建成为 goroutines
		// Schedule the call to Done to tell main we are done.
		defer wg.Done()

		// Display the alphabet three times
		for count := 0; count < 3; count++ {
			for char := 'A'; char < 'A'+26; char++ {
				fmt.Printf("%c ", char)
			}
		}
	}()

	// Wait for the goroutines to finish.
	fmt.Println("Waiting To Finish")
	wg.Wait()  //等待本例中的 2 个 goroutines 都完成其工作 //当 a WaitGroup 的值大于 0 时，Wait()函数会一直阻塞

	fmt.Println("\nTerminating Program")
}
```



In listing 6.1 on line 14, you see a call to the GOMAXPROCS function from the runtime
package. This is the function that allows the program to change the number of logical
processors to be used by the scheduler. There’s also an environmental variable that
can be set with the same name if we don't want to make this call specifically in our
code. By passing the value of 1, we tell the scheduler to use a single logical processor
for this program.



On lines 24 and 37, we declare two anonymous functions that display the English
alphabet. The function on line 24 displays the alphabet with lowercase letters and the
function on line 37 displays the alphabet with uppercase letters. Both of these functions
are created as goroutines by using the keyword go. You can see by the output in
listing 6.2 that the code inside each goroutine is running concurrently within a single
logical processor.

```go
[dev@node_dev b]$ go run demo.go 
Start Goroutines
Waiting To Finish
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z 
Terminating Program

```



The amount of time it takes the first goroutine to finish displaying the alphabet is so
small that it can complete its work before the scheduler swaps it out for the second
goroutine. This is why you see the entire alphabet in capital letters first and then in
lowercase letters second. The two goroutines we created ran concurrently, one after
the other, performing their individual task of displaying the alphabet.



> 此例中，一旦 2 个 匿名函数被创建成为 goroutines 后， main 函数中的 code 会继续运行。
>
> 这意味着 main 函数 能够在  the goroutines 完成其工作之前 return。如果这种情况发生了，
>
> 则程序也就在 the goroutines 有机会运行之前就结束了。
>
> Once the two anonymous functions are created as goroutines, the code in main
> keeps running. This means that the main function can return before the goroutines
> complete their work. If this happens, the program will terminate before the goroutines
> have a chance to run. On line 51, the main function therefore waits for both
> goroutines to complete their work by using a WaitGroup.



>A WaitGroup 是一个计数信号量，其能够被用于维持 正在运行的 goroutines 的记录。
>
>当  a WaitGroup 的值大于 0 时，则 该 Wait 方法发生阻塞。
>
>A WaitGroup is a counting semaphore that can be used to maintain a record of running
>goroutines. When the value of a WaitGroup is greater than zero, the Wait
>method will block. On line 18 a variable of type WaitGroup is created, and then on
>line 19 we set the value of the WaitGroup to 2, noting two running goroutines. To decrement
>the value of the WaitGroup and eventually release the main function, calls to
>the Done method on lines 26 and 39 are made within the scope of a defer statement.



The keyword defer is used to schedule other functions from inside the executing
function to be called when the function returns. In the case of our sample program,
we use the keyword defer to guarantee that the method call to Done is made once
each goroutine is finished with its work.



Based on the internal algorithms of the scheduler, a running goroutine can be
stopped and rescheduled to run again before it finishes its work. The scheduler does
this to prevent any single goroutine from holding the logical processor hostage. It will
stop the currently running goroutine and give another runnable goroutine a chance
to run.



> Figure 6.4 Goroutines being swapped on and off the logical processor’s thread

> Figure 6.4 shows this scenario from a logical processor point of view. In step 1 the
> scheduler begins to execute goroutine A while goroutine B waits for its turn in the
>
> run queue. Then, suddenly in step 2, the scheduler swaps out goroutine A for goroutine
> B. Since goroutine A doesn’t finish, it’s placed back into the run queue. Then, in
> step 3 goroutine B completes its work and it’s gone. This allows goroutine A to get
> back to work.

You can see this behavior by creating a goroutine that requires a longer amount of
time to complete its work.

##### Listing 6.4 listing04.go

```go
// This sample program demonstrates how the goroutine scheduler
// will time slice goroutines on a single thread.
package main

import (
	"fmt"
	"runtime"
	"sync"
)

// wg is used to wait for the program to finish.
var wg sync.WaitGroup  //声明一个信号量

// main is the entry point for all Go programs.
func main() {
	// Allocate 1 logical processors for the scheduler to use.
	runtime.GOMAXPROCS(1)

	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Create two goroutines.
	fmt.Println("Create Goroutines")
	go printPrime("A") //通过 关键字 go 创建 goroutine
	go printPrime("B")

	// Wait for the goroutines to finish.
	fmt.Println("Waiting To Finish")
	wg.Wait()

	fmt.Println("Terminating Program")
}

// printPrime displays prime numbers for the first 5000 numbers.
func printPrime(prefix string) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

next:
	for outer := 2; outer < 5000; outer++ {
		for inner := 2; inner < outer; inner++ {
			if outer%inner == 0 {
				continue next
			}
		}
		fmt.Printf("%s:%d\n", prefix, outer)
	}
	fmt.Println("Completed", prefix)
}
```



The program in listing 6.4 creates two goroutines that print any prime numbers
between 1 and 5,000 that can be found. Finding and displaying the prime numbers
take a bit of time and will cause the scheduler to time-slice the first running goroutine
before it finishes finding all the prime numbers it’s looking for.

When the program starts, it declares a WaitGroup variable on line 12 and then sets
the value of the WaitGroup to 2 on line 20. Two goroutines are created on lines 24 and
25 by specifying the name of the function printPrime after the keyword go. The first
goroutine is given the prefix A and the second goroutine is given the prefix B. Like
any calling function, parameters can be passed into the function being created as a
goroutine. Return parameters aren’t available when the goroutine terminates. When
you look at the output in listing 6.5, you can see the swapping of the first goroutine by
the scheduler.



Goroutine B begins to display prime numbers first. Once goroutine B prints prime
number 4591, the scheduler swaps out the goroutine for goroutine A. Goroutine A is
then given some time on the thread and swapped out for the B goroutine once again.
The B goroutine is allowed to finish all its work. Once goroutine B returns, you see
that goroutine A is given back the thread to finish its work. Every time you run this
program, the scheduler will slightly change the point where the time slice occurs.

Both example programs in listings 6.1 and 6.4 have shown how the scheduler runs
goroutines concurrently within a single logical processor. As stated earlier, the Go
standard library has a function called GOMAXPROCS in the runtime package that allows
you to specify the number of logical processors to be used by the scheduler. This is
how you can change the runtime to allocate a logical processor for every available
physical processor. The next listing will have our goroutines running in parallel.



##### Listing 6.6 How to change the number of logical processors

```go
import "runtime"
// Allocate a logical processor for every available core.
runtime.GOMAXPROCS(runtime.NumCPU())
```

The runtime package provides support for changing Go runtime configuration
parameters. In listing 6.6, we use two runtime functions to change the number of logical
processors for the scheduler to use. The NumCPU function returns the number of
physical processors that are available; therefore, the function call to GOMAXPROCS creates
a logical processor for each available physical processor. It’s important to note
that using more than one logical processor doesn’t necessarily mean better performance.
Benchmarking is required to understand how your program performs when
changing any runtime configuration parameters.



If we give the scheduler more than one logical processor to use, we’ll see different
behavior in the output of our example programs. Let’s change the number of logical
processors to 2 and rerun the first example that printed the English alphabet.

```go
// This sample program demonstrates how to create goroutines and
// how the goroutine scheduler behaves with two logical processor.
package main

import (
	"fmt"
	"runtime"
	"sync"
)

// main is the entry point for all Go programs.
func main() {
	// Allocate two logical processors for the scheduler to use.
	runtime.GOMAXPROCS(2)

	// wg is used to wait for the program to finish.
	// Add a count of two, one for each goroutine.
	var wg sync.WaitGroup
	wg.Add(2)

	fmt.Println("Start Goroutines")

	// Declare an anonymous function and create a goroutine.
	go func() {
		// Schedule the call to Done to tell main we are done.
		defer wg.Done()

		// Display the alphabet three times.
		for count := 0; count < 3; count++ {
			for char := 'a'; char < 'a'+26; char++ {
				fmt.Printf("%c ", char)
			}
		}
	}()

	// Declare an anonymous function and create a goroutine.
	go func() {
		// Schedule the call to Done to tell main we are done.
		defer wg.Done()

		// Display the alphabet three times.
		for count := 0; count < 3; count++ {
			for char := 'A'; char < 'A'+26; char++ {
				fmt.Printf("%c ", char)
			}
		}
	}()

	// Wait for the goroutines to finish.
	fmt.Println("Waiting To Finish")
	wg.Wait()

	fmt.Println("\nTerminating Program")
}
```



If you look closely at the output in listing 6.8, you’ll see that the goroutines are running
in parallel. Almost immediately, both goroutines start running, and the letters in
the display are mixed. The output is based on running the program on an eight-core
machine, so each goroutine is running on its own core. Remember that goroutines
can only run in parallel if there’s more than one logical processor and there’s a physical
processor available to run each goroutine simultaneously.
You now know how to create goroutines and understand what’s happening under
the hood. Next you need to understand the potential dangers and the things to look
out for when writing concurrent programs.



## 6.3 Race conditions

竞争条件

> 当2个或更多的goroutines  可以同时异步访问 一个共享资源(a shared resource) 且视图在同一时间对
>
> 该资源进行读和写操作时。 你就引起了 被称为 竞争条件(a race condition)的情况。
>
> 资源竞争是并发编程负载的原因之一且很容易造成潜在的 bugs. 读和写操作所作用到的那个共享资源
>
> 必须是 原子的，或换而言之，在同一时刻仅能允许只有一个 goroutine 在执行 读/写 操作。
>
> When two or more goroutines have unsynchronized access to a shared resource and
> attempt to read and write to that resource at the same time, you have what’s called a
> race condition. Race conditions are the reason concurrent programming is complicated
> and has a greater potential for bugs. Read and write operations against a
> shared resource must always be atomic, or in other words, done by only one goroutine
> at a time.



Here’s an example program that contains a race condition.

##### Listing 6.9 listing09.go

```go
// This sample program demonstrates how to create race
// conditions in our programs. We don't want to do this.
package main

import (
	"fmt"
	"runtime"
	"sync"
)

var (
	// counter is a variable incremented by all goroutines.
	counter int

	// wg is used to wait for the program to finish.
	wg sync.WaitGroup
)

// main is the entry point for all Go programs.
func main() {
	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Create two goroutines.
	go incCounter(1)
	go incCounter(2)

	// Wait for the goroutines to finish.
	wg.Wait()
	fmt.Println("Final Counter:", counter)
}

// incCounter increments the package level counter variable.
func incCounter(id int) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

	for count := 0; count < 2; count++ {
		// Capture the value of Counter.
		value := counter

		// Yield the thread and be placed back in queue.
		runtime.Gosched() //让出 thread 并被放置回 queue 中，这样其他 goroutine 便有执行的机会了

		// Increment our local value of Counter.
		value++

		// Store the value back into Counter.
		counter = value
	}
}
```



##### Listing 6.10 Output for listing09.go

```text
Final Counter: 2
```

> Figure 6.5 Visual of the race
> condition in action
>
> The counter variable is read and written to four times, twice by each goroutine, but
> the value of the counter variable when the program terminates is 2. Figure 6.5 provides
> a clue as to why this is happening.

Each goroutine overwrites the work of the other. This happens when the goroutine
swap is taking place. Each goroutine makes its own copy of the counter variable and
then is swapped out for the other goroutine. When the goroutine is given time to execute
again, the value of the counter variable has changed, but the goroutine doesn’t
update its copy. Instead it continues to increment the copy it has and set the value
back to the counter variable, replacing the work the other goroutine performed.



Let’s walk through the code to understand what it’s doing. Two goroutines are
created from the function incCounter, which can be seen on lines 25 and 26. The

incCounter function on line 34 reads and writes to the package variable counter,
which is our shared resource in this example. Both goroutines start reading and storing
a copy of the counter variable into a local variable called value on line 40. Then,
on line 46 they increment their copy of value by one and finally assign the new value
back into the counter variable on line 49. The function contains a call to the Gosched
function from the runtime package on line 43 to yield the thread and give the other
goroutine a chance to run. This is being done in the middle of the operation to force
the scheduler to swap between the two goroutines to exaggerate the effects of the
race condition.



> go 有个特殊的 tool 以用来检测代码中的 竞争条件(race conditions).
>
> 这对于查找该类型的 bugs 非常有效。
>
> Go has a special tool that can detect race conditions in your code. It’s extremely
> useful to find these types of bugs, especially when they’re not as obvious as our example.
> Let’s run the race detector against our example code.

##### Listing 6.11 Building and running listing09 with the race detector

```bash
go build -race // Build the code using the race detector flag
./example // Run the code
```



## 6.4 Locking shared resources



> Go 提供了 通过 对 共享资源进行加锁访问的用来同步goroutines  的传统的支持。
>
> 如果你需要序列化访问一个 integer 变量或一块阻塞代码，则在 atomic 包或 sync包中的 functions
>
> 也许是个好的解决方式。
>
> Go provides traditional support to synchronize goroutines by locking access to shared
> resources. If you need to serialize access to an integer variable or a block of code, then
> the functions in the atomic and sync packages may be a good solution. We’ll look at a
> few of the atomic package functions and the mutex type from the sync package.

#### 6.4.1 Atomic functions

> Atomic functions 提供了低级别的锁机制来同步对 integers  和 pointers 的访问。
>
> Atomic functions provide low-level locking mechanisms for synchronizing access to
> integers and pointers. We can use atomic functions to fix the race condition we created
> in listing 6.9.



```go
// This sample program demonstrates how to use the atomic
// package to provide safe access to numeric types.
package main

import (
	"fmt"
	"runtime"
	"sync"
	"sync/atomic"
)

var (
	// counter is a variable incremented by all goroutines.
	counter int64

	// wg is used to wait for the program to finish.
	wg sync.WaitGroup
)

// main is the entry point for all Go programs.
func main() {
	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Create two goroutines.
	go incCounter(1)
	go incCounter(2)

	// Wait for the goroutines to finish.
	wg.Wait()

	// Display the final value.
	fmt.Println("Final Counter:", counter)
}

// incCounter increments the package level counter variable.
func incCounter(id int) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

	for count := 0; count < 2; count++ {
		// Safely Add One To Counter.
		atomic.AddInt64(&counter, 1) //使用了 atomic.AddInt64

		// Yield the thread and be placed back in queue.
		runtime.Gosched()
	}
}
```

>  Listing 6.14 Output for listing13.go

```go
Final Counter: 4
```





> atomic  中的 AddInt64  函数以同步非方式 对整数的值执行 add 操作，其是通过强制在同一时刻
>
> 仅能有一个 goroutine 来执行且完成该 add 操作。当 goroutines 尝试调用 任意的 atomic  函数时，
>
> 它们会自动对所引用的变量进行同步
>
> On line 43 the program is now using the AddInt64 function from the atomic package.
> This function synchronizes the adding of integer values by enforcing that only one
> goroutine can perform and complete this add operation at a time. When goroutines

attempt to call any atomic function, they’re automatically synchronized against the
variable that’s referenced. Now we get the correct value of 4.



> 另外两个有用的 atomic  函数是  LoadInt64 和StoreInt64.它们提供了安全的方式来读取 和写入 integer 值。
>
> 
>
> Two other useful atomic functions are LoadInt64 and StoreInt64. These functions
> provide a safe way to read and write to an integer value. Here’s an example using
> LoadInt64 and StoreInt64 to create a synchronous flag that can alert multiple goroutines
> of a special condition in a program.

Listing 6.15 listing15.go

```go
// This sample program demonstrates how to use the atomic
// package functions Store and Load to provide safe access
// to numeric types.
package main

import (
	"fmt"
	"sync"
	"sync/atomic"
	"time"
)

var (
	// shutdown is a flag to alert running goroutines to shutdown.
	shutdown int64

	// wg is used to wait for the program to finish.
	wg sync.WaitGroup
)

// main is the entry point for all Go programs.
func main() {
	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Create two goroutines.
	go doWork("A")
	go doWork("B")

	// Give the goroutines time to run.
	time.Sleep(1 * time.Second)

	// Safely flag it is time to shutdown.
	fmt.Println("Shutdown Now")
	atomic.StoreInt64(&shutdown, 1)

	// Wait for the goroutines to finish.
	wg.Wait()
}

// doWork simulates a goroutine performing work and
// checking the Shutdown flag to terminate early.
func doWork(name string) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

	for {
		fmt.Printf("Doing %s Work\n", name)
		time.Sleep(250 * time.Millisecond)

		// Do we need to shutdown.
		if atomic.LoadInt64(&shutdown) == 1 {
			fmt.Printf("Shutting %s Down\n", name)
			break
		}
	}
}
```



> In this example two goroutines are launched and begin to perform some work. After
> every iteration of their respective loop, the goroutines check the value of the shutdown
> variable by using the LoadInt64 function on line 52. This function returns a safe
> copy of the shutdown variable. If the value equals 1, the goroutine breaks out of the
> loop and terminates.

> The main function uses the StoreInt64 function on line 35 to safely change the
> value of the shutdown variable. If any of the doWork goroutines attempt to call the
> LoadInt64 function at the same time as the main function calls StoreInt64, the
> atomic functions will synchronize the calls and keep all the operations safe and race
> condition–free.



### 6.4.2 Mutexes

> 互斥器： 
>
> 另一种 同步化 访问 共享资源的 方式是 使用  a mutex.互斥锁以互斥的概念命名(mutual exclusion)。
>
> 互斥锁用于在代码周围创建临界区，以确保一次只能有一个goroutine可以执行该代码区域。
>
> Another way to synchronize access to a shared resource is by using a mutex. A mutex is
> named after the concept of mutual exclusion. A mutex is used to create a critical
> section around code that ensures only one goroutine at a time can execute that code
> section. We can also use a mutex to fix the race condition we created in listing 6.9.

##### Listing 6.16 listing16.go

```go
// This sample program demonstrates how to use a mutex
// to define critical sections of code that need synchronous
// access.
package main

import (
	"fmt"
	"runtime"
	"sync"
)

var (
	// counter is a variable incremented by all goroutines.
	counter int

	// wg is used to wait for the program to finish.
	wg sync.WaitGroup

	// mutex is used to define a critical section of code.
	mutex sync.Mutex
)

// main is the entry point for all Go programs.
func main() {
	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Create two goroutines.
	go incCounter(1)
	go incCounter(2)

	// Wait for the goroutines to finish.
	wg.Wait()
	fmt.Printf("Final Counter: %d\n", counter)
}

// incCounter increments the package level Counter variable
// using the Mutex to synchronize and provide safe access.
func incCounter(id int) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

	for count := 0; count < 2; count++ {
		// Only allow one goroutine through this
		// critical section at a time.
		mutex.Lock()
        { //该大括号之间的代码块 就是 所谓的 临界区了,当然该大括号不是必须的(但最好加上，增加可读性)。在同一时间点仅能有一个goroutine 能够进入该临界区。直到 调用了 其上的 Unlock()后，其他的 某个 goroutine 才能进入该临界区。
			// Capture the value of counter.
			value := counter

			// Yield the thread and be placed back in queue.
			runtime.Gosched()

			// Increment our local value of counter.
			value++

			// Store the value back into counter.
			counter = value
		}
		mutex.Unlock()
		// Release the lock and allow any
		// waiting goroutine through.
	}
}
```

The operations against the counter variable are now protected within a critical section
defined by the calls to Lock() and Unlock() on lines 46 and 60. The use of the
curly brackets is just to make the critical section easier to see; they’re not necessary.
Only one goroutine can enter the critical section at a time. Not until the call to the
Unlock() function is made can another goroutine enter the critical section. When the
thread is yielded on line 52, the scheduler assigns the same goroutine to continue

running. After the program completes, we get the correct value of 4 and the race condition
no longer exists.



## 6.5 Channels

管道(重要)



> 具有原子性的函数 和 互斥量  都是可以工作的，但是使用它们来 并发编程比较有难度且容易出错。
>
> 在 go 中，你并非仅能使用 atomic functions 和 mutexes 来保证 共享资源的安全 和 避免 竞争条件。
>
> 你还有另外的选择，那就是 管道（channels）. 
>
> 您还有在goroutine发送和接收彼此之间共享的资源时同步goroutine的通道
>
> Atomic functions and mutexes work, but they don’t make writing concurrent programs
> easier, less error-prone, or fun. In Go you don’t have only atomic functions and
> mutexes to keep shared resources safe and eliminate race conditions. You also have
> channels that synchronize goroutines as they send and receive the resources they
> need to share between each other.
>
> 
>
> 当一个资源需要在 goroutines 彼此资源共享时，channels  可以在 这些 goroutines  之间充当
>
> 导管的角色 并 提供一种机制来保证 同步交换。
>
> 当声明 一个 channel 的时候，其 被共享的 数据的类型需要被指定。
>
> (类比: 声明管道中数据的类型好比指明生活中的管道是用于传输 水,天然气还是其他物质)
>
> 可以通过通道共享built-in, named, struct, 和 reference types的值和指针。
>
> When a resource needs to be shared between goroutines, channels act as a conduit
> between the goroutines and provide a mechanism that guarantees a synchronous
> exchange. When declaring a channel, the type of data that will be shared needs to be
> specified. Values and pointers of built-in, named, struct, and reference types can be
> shared through a channel.



> 创建管道必须使用 go 语言内置的  make 函数。
>
> Creating a channel in Go requires the use of the built-in function make.



##### Listing 6.17 Using make to create a channel

```go
// Unbuffered channel of integers.
unbuffered := make(chan int) //指定了表示管道的类型 chan 以及管道所允许交换的数据的类型(此例中的数据的类型为 int).
// Buffered channel of strings.
buffered := make(chan string, 10) //如果是创建带缓冲的channel,则还需要通过第二个参数来指定其 缓冲的大小
```



In listing 6.17 you see the use of the built-in function make to create both an unbuffered
and buffered channel. The first argument to make requires the keyword chan and
then the type of data the channel will allow to be exchanged. If you’re creating a buffered
channel, then you specify the size of the channel’s buffer as the second argument.



>  将 一个 value 或 pointer  传送到 管道中 需要使用  <-  操作符
>
> Sending a value or pointer into a channel requires the use of the <- operator.

##### Listing 6.18 Sending values into a channel

```go
// Buffered channel of strings.
buffered := make(chan string, 10)
// Send a string through the channel.
buffered <- "Gopher"  //向管道中 发送数据(助记:箭头符号指向管道就是将数据送进管道中)
```



> In listing 6.18 we create a buffered channel of type string that contains a buffer of 10
> values. Then we send the string “Gopher” through the channel. For another goroutine
> to receive that string from the channel, we use the same <- operator, but this time
> as a unary operator.

##### Listing 6.19 Receiving values from a channel

```go
// Receive a string from the channel.
value := <-buffered  //注: 这里是从 buffered 中 receive 数据,这里的操作符 <- 是一元操作符,//(助记:箭头离开管道就是将数据从管道中送出)

```

When receiving a value or pointer from a channel, the <- operator is attached to the
left side of the channel variable, as seen in listing 6.19.

> 带缓冲的 channels 和 不带缓冲的 channels 其行为上有一点差异。理解该差异将帮助你确定那一种
>
> 更适合于你。
>
> Unbuffered and buffered channels behave a bit differently. Understanding the differences
> will help you determine when to prefer one over the other, so let’s look at
> each type separately.



### 6.5.1 Unbuffered channels

不带 buffer 的管道



> 无 buffer 的管道在其 被 received 之前其是不具备保持(hold)任何值的能力的。 
>
> 这种类型的 管道(channels) 必须在 完成任何 send or receive 操作之前就要求
>
>  a sending and receiving goroutine 都准备就绪。如果在相同的时刻 两个goroutines 
>
> 没有同时就绪，则channel 会使 执行响应 send 或 receive 操作的 goroutine  先等待。
>
> 同步是channel上发送和接收之间交互的固有功能
>
> (好比生活中的磁铁或电流，有正极就必定有负极，或物理中的作用力，
>
> 有作用力就必定有反作用力)。其中一个不可能离开另一个而发生。
>
> An unbuffered channel is a channel with no capacity to hold any value before it’s
> received. These types of channels require both a sending and receiving goroutine to
> be ready at the same instant before any send or receive operation can complete. If the
> two goroutines aren’t ready at the same instant, the channel makes the goroutine that
> performs its respective send or receive operation first wait. Synchronization is inherent
> in the interaction between the send and receive on the channel. One can’t happen
> without the other.



> Figure 6.6 Synchronization between goroutines using an unbuffered channel
>
> 
>
>  In figure 6.6, you see an example of two goroutines sharing a value using an unbuffered
> channel. In step 1 the two goroutines approach the channel, but neither have
> issued a send or receive yet. In step 2 the goroutine on the left sticks its hand into the
> channel, which simulates a send on the channel. At this point, that goroutine is locked
>
> in the channel until the exchange is complete. In step 3 the goroutine on the right
> places its hand into the channel, which simulates a receive on the channel. That
> goroutine is now locked in the channel until the exchange is complete. In steps 4 and
> 5 the exchange is made and finally, in step 6, both goroutines are free to remove
> their hands, which simulates the release of the locks. They both can now go on their
> merry way.



To make this more clear, let’s look at two complete examples that use an unbuffered
channel to synchronize the exchange of data between two goroutines.

In the game of tennis, two players hit a ball back and forth to each other. The players
are always in one of two states: either waiting to receive the ball, or sending the ball
back to the opposing player. You can simulate a game of tennis using two goroutines
and an unbuffered channel to simulate the exchange of the ball.

##### Listing 6.20 listing20.go （模仿网球）

```go
// This sample program demonstrates how to use an unbuffered
// channel to simulate a game of tennis between two goroutines.
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

// wg is used to wait for the program to finish.
var wg sync.WaitGroup

func init() {
	rand.Seed(time.Now().UnixNano())
}

// main is the entry point for all Go programs.
func main() {
	// Create an unbuffered channel.
	court := make(chan int)

	// Add a count of two, one for each goroutine.
	wg.Add(2)

	// Launch two players.
	go player("Nadal", court)     //该 goroutine 开始等待
	go player("Djokovic", court)  //该 goroutine 开始等待

	// Start the set.
	court <- 1      //开始发球

	// Wait for the game to finish.
	wg.Wait()
}

// player simulates a person playing the game of tennis.
func player(name string, court chan int) {
	// Schedule the call to Done to tell main we are done.
	defer wg.Done()

	for {
		// Wait for the ball to be hit back to us.
        ball, ok := <-court  //the goroutine performs a receive on the channel,waiting to receive the ball. This locks the goroutine until a send is performed on the channel.
		if !ok { //如果 ok 为 false, 则意味着 管道被 closed 了，则 game 也 over 了
			// If the channel was closed we won.
			fmt.Printf("Player %s Won\n", name)
			return
		}

		// Pick a random number and see if we miss the ball.
		n := rand.Intn(100)
		if n%13 == 0 {
			fmt.Printf("Player %s Missed\n", name)

			// Close the channel to signal we lost.
			close(court)
			return
		}

		// Display and then increment the hit count by one.
		fmt.Printf("Player %s Hit %d\n", name, ball)
		ball++

		// Hit the ball back to the opposing player.
		court <- ball
	}
}
```

When you run the program, you get the following output.

> Listing 6.21 Output for listing20.go
>
> ```log
> Player Nadal Hit 1
> Player Djokovic Hit 2
> Player Nadal Hit 3
> Player Djokovic Missed
> Player Nadal Won
> ```



In the main function on line 22, an unbuffered channel of type int is created to synchronize
the exchange of the ball being hit by both goroutines. Then the two goroutines
that will be playing the game are created on lines 28 and 29. At this point both
goroutines are locked waiting to receive the ball. On line 32 a ball is sent into the
channel, and the game is played until one of the goroutines lose.

Inside the player function, you find an endless for loop on line 43. Within the
loop, the game is played. On line 45 the goroutine performs a receive on the channel,
waiting to receive the ball. This locks the goroutine until a send is performed on the
channel. Once the receive on the channel returns, the ok flag is checked on line 46

for false. A value of false indicates the channel was closed and the game is over. On
lines 53 through 60 a random number is generated to determine if the goroutine hits
or misses the ball. If the ball is hit, then on line 64 the value of the ball is incremented
by one and the ball is sent back to the other player on line 67. At this point both
goroutines are locked until the exchange is made. Eventually a goroutine misses the
ball and the channel is closed on line 58. Then both goroutines return, the call to
Done via the defer statement is performed, and the program terminates.



> 模仿接力
>
> Another example that uses a different pattern to synchronize goroutines with an
> unbuffered channel is simulating a relay race. In a relay race, four runners take turns
> running around the track. The second, third, and fourth runners can’t start running
> until they receive the baton from the previous runner. The exchange of the baton is a
> critical part of the race and requires synchronization to not miss a step. For this synchronization
> to take place, both runners who are involved in the exchange need to be
> ready at exactly the same time.

Listing 6.22 listing22.go

```go
// This sample program demonstrates how to use an unbuffered
// channel to simulate a relay race between four goroutines.
package main

import (
	"fmt"
	"sync"
	"time"
)

// wg is used to wait for the program to finish.
var wg sync.WaitGroup

// main is the entry point for all Go programs.
func main() {
	// Create an unbuffered channel.
	baton := make(chan int)

	// Add a count of one for the last runner.
	wg.Add(1)

	// First runner to his mark.
	go Runner(baton)

	// Start the race.
	baton <- 1

	// Wait for the race to finish.
	wg.Wait()
}

// Runner simulates a person running in the relay race.
func Runner(baton chan int) {
	var newRunner int

	// Wait to receive the baton.
	runner := <-baton

	// Start running around the track.
	fmt.Printf("Runner %d Running With Baton\n", runner)

	// New runner to the line.
	if runner != 4 {
		newRunner = runner + 1
		fmt.Printf("Runner %d To The Line\n", newRunner)
		go Runner(baton)
	}

	// Running around the track.
	time.Sleep(100 * time.Millisecond)

	// Is the race over.
	if runner == 4 {
		fmt.Printf("Runner %d Finished, Race Over\n", runner)
		wg.Done()
		return
	}

	// Exchange the baton for the next runner.
	fmt.Printf("Runner %d Exchange With Runner %d\n",
		runner,
		newRunner)

	baton <- newRunner
}
```

When you run the program, you get the following output.

Listing 6.23 Output for listing22.go

```go
Runner 1 Running With Baton
Runner 1 Exchange With Runner 2
Runner 2 Running With Baton
Runner 2 Exchange With Runner 3
Runner 3 Running With Baton
Runner 3 Exchange With Runner 4
Runner 4 Running With Baton
Runner 4 Finished, Race Over
```

In the main function on line 17, an unbuffered channel of type int is created to synchronize
the exchange of the baton. On line 20 we add a count of 1 to the WaitGroup
so the main function can wait until the last runner is finished. The first runner takes to
the track on line 23 with the creation of a goroutine, and then on line 26 the baton is
given to the runner and the race begins. Finally, on line 29 the main function waits on
the WaitGroup for the last runner to finish.

Inside the Runner goroutine, you can see how the baton is exchanged from runner
to runner. On line 37 the goroutine waits to receive the baton with the receive call on

the channel. Once the baton is received, the next runner takes his mark on line 46
unless the goroutine represents the fourth runner. On line 50 the runner runs around
the track for 100 milliseconds. On line 55 if the fourth runner just finished running,
the WaitGroup is decremented by the call to Done and the goroutine returns. If this
isn’t the fourth runner, then on line 64 the baton is passed to the next runner who is
already waiting. At this point both goroutines are locked until the exchange is made.
In both examples we used an unbuffered channel to synchronize goroutines to
simulate a tennis game and a relay race. The flow of the code was inline with the way
these events and activities take place in the real world. This makes the code readable
and self-documenting. Now that you know how unbuffered channels work, next you
can learn how buffered channels work.



### 6.5.2 Buffered channels

A buffered channel is a channel with capacity to hold one or more values before they’re
received. These types of channels don’t force goroutines to be ready at the same
instant to perform sends and receives. There are also different conditions for when a
send or receive does block. A receive will block only if there’s no value in the channel
to receive. A send will block only if there’s no available buffer to place the value being
sent. This leads to the one big difference between unbuffered and buffered channels:
An unbuffered channel provides a guarantee that an exchange between two goroutines
is performed at the instant the send and receive take place. A buffered channel
has no such guarantee.



> Figure 6.7 Synchronization between goroutines using a buffered channel

In figure 6.7 you see an example of two goroutines adding and removing items
from a buffered channel independently. In step 1 the goroutine on the right is in the
process of receiving a value from the channel. In step 2 that same goroutine is able to
complete the receive independent of the goroutine on the left sending a new value

into the channel. In step 3 the goroutine on the left is sending a new value into the
channel while the goroutine on the right is receiving a different value. Neither of
these two operations in step 3 are in sync with each other or blocking. Finally, in step 4
all the sends and receives are complete and we have a channel with several values and
room for more.



Let’s look at an example using a buffered channel to manage a set of goroutines to
receive and process work. Buffered channels provide a clean and intuitive way to
implement this code.

##### Listing 6.24 listing24.go

```go
// This sample program demonstrates how to use a buffered
// channel to work on multiple tasks with a predefined number
// of goroutines.
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	numberGoroutines = 4  // Number of goroutines to use.
	taskLoad         = 10 // Amount of work to process.
)

// wg is used to wait for the program to finish.
var wg sync.WaitGroup

// init is called to initialize the package by the
// Go runtime prior to any other code being executed.
func init() {
	// Seed the random number generator.
	rand.Seed(time.Now().Unix())
}

// main is the entry point for all Go programs.
func main() {
	// Create a buffered channel to manage the task load.
	tasks := make(chan string, taskLoad)

	// Launch goroutines to handle the work.
	wg.Add(numberGoroutines)
	for gr := 1; gr <= numberGoroutines; gr++ {
		go worker(tasks, gr)
	}

	// Add a bunch of work to get done.
	for post := 1; post <= taskLoad; post++ {
		tasks <- fmt.Sprintf("Task : %d", post)
	}

	// Close the channel so the goroutines will quit
	// when all the work is done.
	close(tasks)

	// Wait for all the work to get done.
	wg.Wait()
}

// worker is launched as a goroutine to process work from
// the buffered channel.
func worker(tasks chan string, worker int) {
	// Report that we just returned.
	defer wg.Done()

	for {
		// Wait for work to be assigned.
		task, ok := <-tasks
		if !ok {
			// This means the channel is empty and closed.
			fmt.Printf("Worker: %d : Shutting Down\n", worker)
			return
		}

		// Display we are starting the work.
		fmt.Printf("Worker: %d : Started %s\n", worker, task)

		// Randomly wait to simulate work time.
		sleep := rand.Int63n(100)
		time.Sleep(time.Duration(sleep) * time.Millisecond)

		// Display we finished the work.
		fmt.Printf("Worker: %d : Completed %s\n", worker, task)
	}
}
```

When you run the program, you get the following output.

> Listing 6.25 Output for listing24.go

```log
Worker: 1 : Started Task : 1
Worker: 2 : Started Task : 2
Worker: 3 : Started Task : 3
Worker: 4 : Started Task : 4
Worker: 1 : Completed Task : 1
Worker: 1 : Started Task : 5
Worker: 4 : Completed Task : 4
Worker: 4 : Started Task : 6
Worker: 1 : Completed Task : 5
Worker: 1 : Started Task : 7
Worker: 2 : Completed Task : 2
Worker: 2 : Started Task : 8
Worker: 3 : Completed Task : 3
Worker: 3 : Started Task : 9
Worker: 1 : Completed Task : 7
Worker: 1 : Started Task : 10
Worker: 4 : Completed Task : 6
Worker: 4 : Shutting Down
Worker: 3 : Completed Task : 9
Worker: 3 : Shutting Down
Worker: 2 : Completed Task : 8
Worker: 2 : Shutting Down
Worker: 1 : Completed Task : 10
Worker: 1 : Shutting Down
```

Because of the random nature of the program and the Go scheduler, the output for
this program will be different every time you run it. But the use of all four goroutines
to process work from the buffered channel won’t change. You can see from the output
how each goroutine is receiving work distributed from the channel.



In the main function on line 31, a buffered channel of type string is created with
a capacity of 10. On line 34 the WaitGroup is given the count of 4, one for each goroutine
that’s going to be created. Then on lines 35 through 37, four goroutines are created
and passed the channel they will be receiving the work on. On lines 40 through
42, 10 strings are sent into the channel to simulate work for the goroutines. Once the
last string is sent into the channel, the channel is closed on line 46 and the main function
waits for all the work to be completed on line 49.

Closing the channel on line 46 is an important piece of code. When a channel is
closed, goroutines can still perform receives on the channel but can no longer send
on the channel. Being able to receive on a closed channel is important because it
allows the channel to be emptied of all its values with future receives, so nothing in
the channel is ever lost. A receive on a closed and empty channel always returns immediately
and provides the zero value for the type the channel is declared with. If you
also request the optional flag on the channel receive, you can get information about
the state of the channel.
Inside the worker function you find an endless for loop on line 58. Within the loop,
all of the received work is processed. Each goroutine blocks on line 60 waiting to receive
work from the channel. Once the receive returns, the ok flag is checked to see if the
channel is both empty and closed. If the value of ok is false, the goroutine terminates,
which causes the defer statement on line 56 to call Done and report back to main.
If the ok flag is true, then the value received is valid. Lines 71 and 72 simulate
work being processed. Once the work is done, the goroutine blocks again in the
receive of the channel on line 60. Once the channel is closed, the receive on the channel
returns immediately and the goroutine terminates itself.
The examples for the unbuffered and buffered channels provided a good sampling
of the kind of code you can write with channels. In the next chapter we’ll look at
real-world concurrency patterns that you could use in your own projects.





# Concurrency patterns

In chapter 6 you learned what concurrency is and how channels behave, and
reviewed code that showed concurrency in action. In this chapter you’ll extend that
knowledge by reviewing more code. We’ll review three packages that implement
different concurrency patterns that you can use in your own projects. Each package
provides a practical perspective on the use of concurrency and channels and how
they can make concurrent programs easier to write and reason about.



## 7.1 Runner

The purpose of the runner package is to show how channels can be used to monitor
the amount of time a program is running and terminate the program if it runs
too long. This pattern is useful when developing a program that will be scheduled
to run as a background task process. This could be a program that runs as a cron
job, or in a worker-based cloud environment like Iron.io.
Let’s take a look at the runner.go code file from the runner package.

##### Listing 7.1 runner/runner.go

```go
// Example is provided with help by Gabriel Aszalos.
// Package runner manages the running and lifetime of a process.
package runner

import (
	"errors"
	"os"
	"os/signal"
	"time"
)

// Runner runs a set of tasks within a given timeout and can be
// shut down on an operating system interrupt.
type Runner struct {
	// interrupt channel reports a signal from the
	// operating system.
	interrupt chan os.Signal //该管道用于发送和接受来自 os.Signal 接口类型的值，且其被用于接受主机操作系统的中断事件。

	// complete channel reports that processing is done.
	complete chan error  //该管道用于发送和接受 error 接口类型的 value.

	// timeout reports that time has run out.
	timeout <-chan time.Time

	// tasks holds a set of functions that are executed
	// synchronously in index order.
	tasks []func(int)
}

// ErrTimeout is returned when a value is received on the timeout channel.
var ErrTimeout = errors.New("received timeout")

// ErrInterrupt is returned when an event from the OS is received.
var ErrInterrupt = errors.New("received interrupt")

// New returns a new ready-to-use Runner.
func New(d time.Duration) *Runner {
	return &Runner{
		interrupt: make(chan os.Signal, 1),
		complete:  make(chan error),
		timeout:   time.After(d),
	}
}

// Add attaches tasks to the Runner. A task is a function that
// takes an int ID.
func (r *Runner) Add(tasks ...func(int)) {
	r.tasks = append(r.tasks, tasks...)
}

// Start runs all tasks and monitors channel events.
func (r *Runner) Start() error {
	// We want to receive all interrupt based signals.
	signal.Notify(r.interrupt, os.Interrupt)

	// Run the different tasks on a different goroutine.
	go func() {
		r.complete <- r.run()
	}()

	select {
	// Signaled when processing is done.
	case err := <-r.complete:
		return err

	// Signaled when we run out of time.
	case <-r.timeout:
		return ErrTimeout
	}
}

// run executes each registered task.
func (r *Runner) run() error {
	for id, task := range r.tasks {
		// Check for an interrupt signal from the OS.
		if r.gotInterrupt() {
			return ErrInterrupt
		}

		// Execute the registered task.
		task(id)
	}

	return nil
}

// gotInterrupt verifies if the interrupt signal has been issued.
func (r *Runner) gotInterrupt() bool {
	select {
	// Signaled when an interrupt event is sent.
	case <-r.interrupt:
		// Stop receiving any further signals.
		signal.Stop(r.interrupt) //通过调用Stop函数来请求停止接收任何未来的events.
		return true

    /*
    通常情况下 从类似如上的 <-r.interrupt 从管道中 没有可 receive 的 data 时会发生阻塞(blocking)。
    但是，如下的 select 中的 default 语句则将 从 管道中读取的操作转换成为了 非阻塞(noblocking) 的调用。
    即此时 如果有数据能从 r.interrupt 管道中receive,则其会被received 并 processed.如果没有(nothing)
    读取的数据，则执行 default 语句。
    */
	// Continue running as normal.
	default:
		return false //如果没有 interupt event 被接收到，则返回 false.
	}
}
```



















> 可变参数
>
> Listing 7.9 shows the Add method, which is declared with a single varadic parameter
> named tasks. Varadic parameters can accept any number of values that are passed in. In
> this case the value must be a function that accepts a single integer value and returns
> nothing. The tasks parameter, once inside the code, becomes a slice of these function
> values.





The Start method implements the main workflow for the program. In listing 7.12 on



## 7.2 Pooling

```go
// Example provided with help from Fatih Arslan and Gabriel Aszalos.
// Package pool manages a user defined set of resources.
package pool

import (
	"errors"
	"io"
	"log"
	"sync"
)

// Pool manages a set of resources that can be shared safely by
// multiple goroutines. The resource being managed must implement
// the io.Closer interface.
type Pool struct {
	m         sync.Mutex
	resources chan io.Closer
	factory   func() (io.Closer, error)
	closed    bool
}

// ErrPoolClosed is returned when an Acquire returns on a
// closed pool.
var ErrPoolClosed = errors.New("Pool has been closed.")

// New creates a pool that manages resources. A pool requires a
// function that can allocate a new resource and the size of
// the pool.
func New(fn func() (io.Closer, error), size uint) (*Pool, error) {
	if size <= 0 {
		return nil, errors.New("Size value too small.")
	}

	return &Pool{
		factory:   fn,
		resources: make(chan io.Closer, size),
	}, nil
}

// Acquire retrieves a resource	from the pool.
func (p *Pool) Acquire() (io.Closer, error) {
	select {
	// Check for a free resource.
	case r, ok := <-p.resources:
		log.Println("Acquire:", "Shared Resource")
		if !ok {
			return nil, ErrPoolClosed
		}
		return r, nil

	// Provide a new resource since there are none available.
	default:
		log.Println("Acquire:", "New Resource")
		return p.factory()
	}
}

// Release places a new resource onto the pool.
func (p *Pool) Release(r io.Closer) {
	// Secure this operation with the Close operation.
	p.m.Lock()
	defer p.m.Unlock()

	// If the pool is closed, discard the resource.
	if p.closed {
		r.Close()
		return
	}

	select {
	// Attempt to place the new resource on the queue.
	case p.resources <- r:
		log.Println("Release:", "In Queue")

	// If the queue is already at cap we close the resource.
	default:
		log.Println("Release:", "Closing")
		r.Close()
	}
}

// Close will shutdown the pool and close all existing resources.
func (p *Pool) Close() {
	// Secure this operation with the Release operation.
	p.m.Lock()
	defer p.m.Unlock()

	// If the pool is already close, don't do anything.
	if p.closed {
		return
	}

	// Set the pool as closed.
	p.closed = true

	// Close the channel before we drain the channel of its
	// resources. If we don't do this, we will have a deadlock.
	close(p.resources)

	// Close the resources
	for r := range p.resources {
		r.Close()
	}
}

```





## 7.3 Work



```go
// Example provided with help from Jason Waldrip.
// Package work manages a pool of goroutines to perform work.
package work

import "sync"

// Worker must be implemented by types that want to use
// the work pool.
type Worker interface {
	Task()
}

// Pool provides a pool of goroutines that can execute any Worker
// tasks that are submitted.
type Pool struct {
	work chan Worker
	wg   sync.WaitGroup
}

// New creates a new work pool.
func New(maxGoroutines int) *Pool {
	p := Pool{
		work: make(chan Worker),
	}

	p.wg.Add(maxGoroutines)
	for i := 0; i < maxGoroutines; i++ {
		go func() {
			for w := range p.work {
				w.Task()
			}
			p.wg.Done()
		}()
	}

	return &p
}

// Run submits work to the pool.
func (p *Pool) Run(w Worker) {
	p.work <- w
}

// Shutdown waits for all the goroutines to shutdown.
func (p *Pool) Shutdown() {
	close(p.work)
	p.wg.Wait()
}
```



# Standard library

## 8.1 Documentation and source code



No matter how you installed Go, all the source code for the standard library can be
found on your development machine in the $GOROOT/src/pkg folder.

> 在 $GOROOT/src/pkg 下可以找到源码



Having the
source code for the standard library is important for the Go tooling to work. Tools like
godoc, gocode, and even go build read this source code to perform their functions. If
this source code is not on your machine and accessible through the $GOROOT variable,
you’ll get errors when trying to build your programs.

> 标准库源码的存在对于 go tools 来说是非常重要的。
>
> 像 godoc, gocode 甚至 go build 工具在执行其功能的时候都会读取这些源码。
>
> 

The source code for the standard library is precompiled as part of your Go distribution
package. These precompiled files, called archive files, can be found in the
$GOROOT/pkg folder for each target platform and operating system you have installed.

In figure 8.3 you can see files with an .a extension, which are the archive files.

> $GOROOT/pkg 是预编译的标准库

These files are special static Go libraries that the Go build tools create and use
when compiling and linking your final programs together. This helps the build process
to be fast. But there’s no way to specify these files when performing a build, so
you can’t share them. The Go tooling knows when it can use an existing .a file and
when it needs to rebuild one from the source code on your machine.



## 8.2 Logging

> But if your program only writes logs, then it’s common
> practice to write general logging information to stdout and errors or warnings
> to stderr.



### 8.2.1 Log package



```go
// This sample program demonstrates how to use the base log package.
package main

import (
	"log"
)

func init() {
	log.SetPrefix("TRACE: ") //log 配置一般都写在 init 函数中。而 PREFIX 一般都是大写字母的
	log.SetFlags(log.Ldate | log.Lmicroseconds | log.Llongfile)
}

func main() {
	// Println writes to the standard logger.
    log.Println("message") //这些log xxxln函数(如Println)都有其format版本(如Printf) //The Print family of functions is the standard way to write log messages.

	// Fatalln is Println() followed by a call to os.Exit(1).
	log.Fatalln("fatal message")  //The Fatal family of functions is used to write a log message and then terminate the program using the os.Exit(1) function call.

	// Panicln is Println() followed by a call to panic().
	log.Panicln("panic message") //The Panic family of functions is used to write a log message and then issue a panic, which unless recovered, will cause the program to terminate and stack trace.
}
```



> On lines 08 through 11, we have a function called init(). This function is executed
> before main() as part of the program initialization. It’s common to set the log configuration
> inside of init() so the log package can be used immediately when the program
> starts. In our program on line 09, we set the string to be used as a prefix for each
> line. This should be a string that allows you to identify a log line over normal program
> output. Traditionally this string is written in capital letters.



[dev@node_dev src]$ vim ./log/log.go

```go
const (
        Ldate         = 1 << iota     // the date in the local time zone: 2009/01/23
        Ltime                         // the time in the local time zone: 01:23:23
        Lmicroseconds                 // microsecond resolution: 01:23:23.123123.  assumes Ltime.
        Llongfile                     // full file name and line number: /a/b/c/d.go:23
        Lshortfile                    // final file name element and line number: d.go:23. overrides Llongfile
        LUTC                          // if Ldate or Ltime is set, use UTC rather than the local time zone
        Lmsgprefix                    // move the "prefix" from the beginning of the line to before the message
        LstdFlags     = Ldate | Ltime // initial values for the standard logger
)

```



> The iota keyword has a special purpose when it comes to declaring a block of constants.
> It instructs the compiler to duplicate the expression for every constant until the
> block ends or an assignment statement is found. Another function of the iota keyword
> is that the value of iota for each preceding constant gets incremented by 1, with
> an initial value of 0. Let’s look at this more closely.
>
> iota 关键字：

Listing 8.7 Use of the keyword iota

```go
const (
Ldate = 1 << iota // 1 << 0 = 000000001 = 1
Ltime // 1 << 1 = 000000010 = 2
Lmicroseconds // 1 << 2 = 000000100 = 4
Llongfile // 1 << 3 = 000001000 = 8
Lshortfile // 1 << 4 = 000010000 = 16
...
)
```



Listing 8.7 shows what’s happening behind the scenes with the constant declarations.
The << operator performs a left bitwise shift of the bits represented by the value on
the left side of the operator. In each case the bit pattern for the value of 1 is shifted to
the left iota position. This has the effect of giving each constant its own unique bit
position, which you’ll see is perfect when working with flags.



The LstdFlags constant shows the purpose behind giving each constant its own
unique bit position.

> Listing 8.8 Declaration of the LstdFlags constant
>
> ```go
> const (
> ...
> LstdFlags = Ldate(1) | Ltime(2) = 00000011 = 3
> )
> ```
>
> 

In listing 8.8 you see the LstdFlags constant break the iota chain because of the use
of the assignment operator. The LstdFlags constant is assigned the value of 3, thanks
to the fact that the pipe operator (|) is used to or bits together. Or’ing bits is equivalent
to joining bits so each individually set bit is then represented in the final value.
When bits 1 and 2 are ored together, they form the value of 3.
Let’s look again at how we set the log flags we wanted applied.





> 
>
> One nice thing about the log package is that loggers are multigoroutine-safe. This
> means that multiple goroutines can call these functions from the same logger value at
> the same time without the writes colliding with each other. The standard logger and
> any customized logger you may create will have this attribute.



### 8.2.2 Customized loggers



Creating customized loggers require that you create your own Logger type values.
Each logger you create can be configured for a unique destination and set with its
own prefix and flags. Let’s look at an example program that creates different Logger
type pointer variables to support different logging levels.



Listing 8.11 listing11.go

```go
// This sample program demonstrates how to create customized loggers.
package main

import (
	"io"
	"io/ioutil"
	"log"
	"os"
)

var (
	Trace   *log.Logger // Just about anything
	Info    *log.Logger // Important information
	Warning *log.Logger // Be concerned
	Error   *log.Logger // Critical problem
)

func init() {
	file, err := os.OpenFile("errors.txt",
		os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if err != nil {
		log.Fatalln("Failed to open error log file:", err)
	}

	Trace = log.New(ioutil.Discard,
		"TRACE: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	Info = log.New(os.Stdout,
		"INFO: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	Warning = log.New(os.Stdout,
		"WARNING: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	Error = log.New(io.MultiWriter(file, os.Stderr),
		"ERROR: ",
		log.Ldate|log.Ltime|log.Lshortfile)
}

func main() {
	Trace.Println("I have something standard to say")
	Info.Println("Special Information")
	Warning.Println("There is something you need to know about")
	Error.Println("Something has failed")
}
```



Listing 8.14 golang.org/src/log/log.go

```go
// New creates a new Logger. The out variable sets the
// destination to which log data will be written.
// The prefix appears at the beginning of each generated log line.
// The flag argument defines the logging properties.
func New(out io.Writer, prefix string, flag int) *Logger {
  return &Logger{out: out, prefix: prefix, flag: flag}
}
```



Listing 8.16 golang.org/src/io/ioutil/ioutil.go

```go
// devNull is a named type using int as its base type.
type devNull int
// Discard is an io.Writer on which all Write calls succeed
// without doing anything.
var Discard io.Writer = devNull(0)
// Implementation of the io.Writer interface.
func (devNull) Write(p []byte) (int, error) {
	return len(p), nil
}
```



Listing 8.16 shows the declaration of the Discard variable and the implementation
surrounding it. The Discard variable is declared to be of interface type io.Writer
and is given a value of 0 of type devNull. Anything written to this variable is discarded
based on the implementation of the Write method for the devNull type. Using the
Discard variable is a technique you can use to disable a logging level when the output
for that level is not required.



Listing 8.18 golang.org/src/os/file.go

```go
// Stdin, Stdout, and Stderr are open Files pointing to the standard
// input, standard output, and standard error file descriptors.
var (
Stdin = NewFile(uintptr(syscall.Stdin), "/dev/stdin")
Stdout = NewFile(uintptr(syscall.Stdout), "/dev/stdout")
Stderr = NewFile(uintptr(syscall.Stderr), "/dev/stderr")
)
os/file_unix.go
// NewFile returns a new File with the given file descriptor and name.
func NewFile(fd uintptr, name string) *File {
```



In listing 8.18 you can see the declaration for the three variables that represent the
standard destinations that exist on all operating systems: Stdin, Stdout, and Stderr.
All these variables are declared to be pointers of type File, which implements the
io.Writer interface. This leads us to the final logger, Error.



Listing 8.19 listing11.go: lines 37–39

```go
 Error = log.New(io.MultiWriter(file, os.Stderr),
   "ERROR: ",
   log.Ldate|log.Ltime|log.Lshortfile)
```

In listing 8.19 you can see that the first parameter to the New function comes from a
special function called MultiWriter from the io package.



Listing 8.20 Declaration of the MultiWriter function in the io package

```go
io.MultiWriter(file, os.Stderr)
```

Listing 8.20 isolates the call to the MultiWriter function, which returns an interface
type value of io.Writer that contains both the file that we opened and the stderr
destination. The MultiWriter function is a variadic function that accepts any number
of values that implement the io.Writer interface. The function returns a single
io.Writer value that bundles all of the io.Writer values that are passed in. This

allows functions like log.New to accept multiple writers within a single writer. Now
when we write a log using the Error logger, the output will be written to both the file
and stderr.
Now that you know how to create custom loggers, let’s look at how you can use
them to write messages.



Listing 8.21 listing11.go: lines 42–47

```go
func main() {
	Trace.Println("I have something standard to say")
	Info.Println("Special Information")
	Warning.Println("There is something you need to know about")
	Error.Println("Something has failed")
}
```





Listing 8.22 Declarations of the different logging methods

```go
func (l *Logger) Fatal(v ...interface{})
func (l *Logger) Fatalf(format string, v ...interface{})
func (l *Logger) Fatalln(v ...interface{})
func (l *Logger) Flags() int
func (l *Logger) Output(calldepth int, s string) error
func (l *Logger) Panic(v ...interface{})
func (l *Logger) Panicf(format string, v ...interface{})
func (l *Logger) Panicln(v ...interface{})
func (l *Logger) Prefix() string
func (l *Logger) Print(v ...interface{})
func (l *Logger) Printf(format string, v ...interface{})
func (l *Logger) Println(v ...interface{})
func (l *Logger) SetFlags(flag int)
func (l *Logger) SetPrefix(prefix string)
```

Listing 8.22 shows all the methods that have been implemented for the Logger type



## 8.3 Encoding/Decoding

Many applications, whether they’re using databases, making web calls, or working
within a distributed system, need to consume and publish data. If your application is
working with either XML or JSON, the standard library has packages called xml and
json that make working with these data formats trivial. If you have your own data formats
that need to be encoded and decoded, the implementation of these packages is a
great road map of how to implement your own packages.



> json 还可以被转换成 bson,其进一步减少了其 size

Working with and using JSON is more common nowadays than working with XML.
This is primarily because using JSON requires less markup than working with XML.
This means less data per message needs to be sent over the network, which helps with
the overall performance of the system. Also, JSON can be transformed into BSON
(Binary JavaScript Object Notation), which reduces the size of each message even further.





### 8.3.1 Decoding JSON





























































