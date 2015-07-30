#Objective-c 轉 Swift 參考文件
##1.swift與objective-c的相異之處

-	在 objective-c 中， 我們必須將所要用的標頭檔在一個.h檔中import它，並在.h檔中宣告全域變數或是storyboard 新增的元件，然後在.m檔中import這個.h 檔，如此一來才能在.m 中使用剛剛在.h 宣告的變數以及其標頭檔所包含的function 但在 swift 中我們只需要一個檔案去控制一個view，而會參考到的標頭檔以及所用到的全域變數則全部放在這個檔案中
	
-	swift不用分號來區隔兩行code， 除非兩行code寫在同一行
	
	ex:
				
				a = b + c
		 		x = y / z
				
	ex:
				
				a = b + c ; x = y / z

- swift 沒有指標 ，因為指標可以直接存取記憶體，swift注重安全性，避免非法記憶體存取造成crash，所以並沒有指標

- 在swift 當中 ， 宣告變數用 var ， 宣告常數用 let （[範例程式](https://gist.github.com/LitSnow/dec91911f635a64fcbc9))

- 在swift 當中用"printfln" 來顯示字串 ， objective-c則使用"NSLog"([範例程式](https://gist.github.com/LitSnow/8060561af80a6313b02b))
	
  	
  	- objective-c:
				
				int a = 5;
				NSLog(@" a = %i" , a);
				
  	- swift:
				
				var a : Int = 5
				printfln("\(a)")
	 
	
	- 以上兩段程式碼做的是同樣的事
		  將Int型態的變數a以string 的形式顯示出來
		  swift用一個" \() " ，括弧內放欲顯示的變數 	
- swift和objective-c在宣告變數常數上的不同
	
	- objective-c:
			
		 		UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];

	- swift:
			
				let myTableView: UITableView = UITableView(frame: CGRectZero, style: .Grouped)

	- swift在設定某物件的屬性時幾乎不用中括弧[]
	-  以上兩段程式碼做的是同樣的事宣告一個資料型態為UITableView的常數myTableView，並給予他初值

- swift和objective-c在定義function上的不同 （範例專案Kotel中的 HttpController.swift）

	- objective-c:
			
				- (NSDate *)dueDateForProject:(id *)sender;
		
	- swift:
		
				func dueDateForProject(sender: anyobject!) -> NSDate!
			
		
	-  以上兩段程式碼做的是同樣的事 ，function名稱為dueDateForProject ， 參數型態為id/anyobject ，回傳值型態為 NSDate
	-  swift的anyobject型態 ＝ objective-c的id型態 
		
- swift 的 optional（[範例程式](https://gist.github.com/LitSnow/dec91911f635a64fcbc9)）

   	 - ? : 可能有值，可能無值，想成封裝
	 -  ! : 一口咬定有值，強制認為有值，想成強制拆封

			第6行： 宣告變數c時一口咬定他之後會有值
			第9行 : 一開就強制認為c之後一定會有值，所以此處用c運算時直接使用
	
			第17行 : 一開始宣告變數z時我們不確定，之後使用到z時他會不會有值，所以使用?
			第20行 : 在此處的運算需要用到變數z所以不管z是否有值我們都必須用!去強制拆封取得z的值
					所幸我們在第21行有給變數z一個值，若是沒有給z一個值，在第23行強制拆封要使用卻沒有值
					有可能造成crash
- swift和objective-c在closure(閉包)的不同 （ [範例程式](https://gist.github.com/LitSnow/dec91911f635a64fcbc9)）
			
	- objective-c:
				
				void (^completionBlock)(NSData *, NSError *) = ^(NSData *data, NSError *error) {/* ... */}
				
	- swift:
				
				let completionBlock: (NSData, NSError) -> Void = {data, error in /* ... */}
				
			
	-  以上兩段程式碼做的是同樣的事，completionBlock為closure名稱，void為回傳值型態，data和 error為要傳入的參數名稱，而NSData和 NSError為傳入的參數型態





##2.swift 使用JSON作為資料來源（範例專案Kotel）
- step1([看HotelSingle.swift](https://gist.github.com/LitSnow/f2425394f636eb2c0fdd)):
		
	- 一開始先建立HotelSingle類別，類別中建立了各種屬性，像是"name"，"rank"，"address"...等，目的主要是協助以Dictionary型別取得JSON資料各種欄		位像是"旅宿名稱"，"鄉鎮"，"地址"...等
	  
	          第16~26行：取得Dictionary型別的JSON資料，參數dict代表每家旅館的詳細資料
- step2([看HttpController.swift](https://gist.github.com/LitSnow/fc59c0ea37a1770fb1ef)):
 	- 這個檔案包含一個Httpprotocol協議和HttpController類別，HttpController類別中的onSearch()方法以非同步的方式取得指定網址的JSON資料
 		，再透過Httpprotocol協議的 didReceiveResults方法將資料傳遞給myTableViewController
 		      
 		    第3~5行：建立Httpprotocol協議，並在協議中定義didReceiveResult()方法取得第34行委派傳送的陣列資料
 			第9行：建立委派物件delegate
 			第11~31行：建立onSearch方法，以非同步取得指定網址的JSON資料
 			第23~28行：連線若是成功，將讀取的資料放進array，並透過delegate物件執行委派，也就是執行委派的didReceiveResults方法 
 			  			，將array傳出去	
- step3([看myTableViewController.swift](https://gist.github.com/LitSnow/8b414454db9a86df6027)):
 	- 這個檔案接受JSON資料	
 		
 			第3行 : 繼承Httpprotocol協議
 			第23~28行: 實作委派取得所有資料
 			第28行 : HttpController委託myTableViewController 代理
 			第29行 : 輸入我們欲使用的JSON資料網址 	

##3.swift MapKit的應用（範例專案Kotel中的secondViewController.swift）
- 在swift中若是要使用地圖相關功能必須 import MapKit 若是要使用定位相關功能必須 import CoreLocation
- 地址轉經緯度
	- Code裡的MapKit View 元件沒辦法直接用地址字串去定位，但資料來源只有地址的話我們就必須把地址轉成經緯度
   		  在使用經緯度資料在地圖上找到我們要的位置
   	- 地址轉經緯度函式
   					
   					let geoCoder = CLGeocoder()
        			geoCoder.geocodeAddressString("這裏放欲轉換的地址" as! String, completionHandler: {
                
                	(placemarks:[AnyObject]!,error:NSError!) -> Void in
          			let placemark = placemarks[0] as! CLPlacemark
        		})
        		
        -  目標地址的經度：placemark.location.coordinate.longitude
        - 目標地址的緯度：placemark.location.coordinate.latitude
        
 - 用大頭針在地圖上標示位置([範例程式](https://gist.github.com/LitSnow/2cd60a1ba421f3b64f6c))
  			
  			第38行: 宣告地圖中心點		
  			第39行：宣告地圖縮放比例
   		 	第40行：宣告地圖中心點，設定地圖縮放比例
   		 	第41行：設定地圖中心點
   			第43~49行: 在目標位置插上大頭針做標示
   			第43行：新增一個大頭針
   		 	第45行：設定大頭針的座標位址
   		 	第46~47行：設定當點擊大頭針時出現的title以及subtitle
   			第49行： 把大頭針插在地圖上

##4.swift Cocoapods環境安裝
-  step1:
		開啟終端機輸入 
					
					sudo gem install cocoapods
					
		
	這邊會等蠻久的，一開始會以為沒有反應，但不要關掉重開，等待即可看到" gems installed "代表安裝完成
	
- step2:
  		終端機輸入 
  				
  				 cd 這裏輸入你的目標專案資料夾路徑 
  		
  		
  這個專案資料夾路徑就是欲使用cocoapods的專案所在的資料夾
  
- step3: 
  		在專案資料夾內建立一個文字檔"Podfile.txt"
  		Podfile.txt 裡面輸入要用的函式庫以及其版本
  		一定要叫"Podfile"，不可以自己任意取名，建立好之後一定要將副檔名刪掉
  		
  	ex:
  				
  				platform :ios, '7.0'
				pod "AFNetworking", "~> 2.0"
  				pod 'Parse', '~> 1.7.1'
				pod 'ParseUI', '~> 1.1.3'
				
	-  AFNetworking 這個函式庫比較特別，第1行的意思是AFNetworking支持的iOS最新版本是iOS 8.1 
		  若沒有要用到AFNetworking，就不需要第1行
		  
	- 如果要用複製貼上的方式，一定要按左上角的格式-> 製作純文字格式
		  否則在step4 輸入 " pod install" 系統會將Podfile檔內的文字視為錯誤格式
    - 建立好之後將Podfile.txt 的副檔名刪掉 
  
 - step4:
		終端機輸入 
			
					 pod install
	
	- 就會開始下載 1.7.1 版本的Parse函式庫,1.1.3 版本的ParseUI函式庫以及2.0版本的AFNetworking函式庫並安裝看到終端機顯示"Sending stats"代表安裝成功安裝成功後資料夾內會出現一個Podfile.lock檔案，它的作用是紀錄以下載的函式庫以及其版本還會出現一個新的"專案名.xcworkspace"檔，跟原本的".xcxcodeproj"長得很像，但他是白色的
	之後就用這個檔案撰寫程式

##5. swift與parse之間的連結（範例專案parsePracticeSwift）
-  Parse 是以objective-c所撰寫的，要在swift專案中使用必須先做好設定

- step1:
		安裝cocoapods以及Parse函式庫以及ParseUI函式庫
		(參照第5點)	Podfile檔案內輸入以下文字
				
				pod 'Parse', '~> 1.7.1'
				pod 'ParseUI', '~> 1.1.3' 
				
				
-  step2:
		在swift專案中新增一個objective-c檔案模板來設置一個objective-c Bridging Header假設我們幫新增的objective-c檔案取名叫做"new"，則會自動新增兩個檔案: "new.m"和"new-Bridging-Header.h" ， "new.m"我們不會用到可以刪掉，"new-Bridging-Header.h" 在Framework資料夾目錄下然後開啟"new-Bridging-Header.h" ，在裡面撰寫以下程式碼
					
				#import <Parse/Parse.h>
				#import <ParseUI/ParseUI.h>
				#import <Bolts/Bolts.h>
					
	我們就可以在這個專案使用跟Parse有關的各種函式了

-  step3:
		在Parse中，每個APP都有其專屬的APP Key，我們會需要裡面的Application ID和Client Key
		這就像帳號密碼一樣，確保我們的專案讀取到正確的資料也添增APP的安全性
		我們到專案中AppDelegate.swift中找到以下程式碼並輸入第2行程式碼
		
			func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) 			-> Bool  {
    				
    				Parse.setApplicationId( "這裏輸入Application ID" , clientKey: "這裏輸入Client Key" )
 					return true  
			}
		
		
	接著執行看看，若是sucessed代表專案與Parse以及cocoapods已經連接成功
		
- step4:
	-  使用存在Parse的資料
		 
		 ex:
				    
				    var query:PFQuery=PFQuery(className: "在Parse中建立的class名稱")
		
	-  ParseUI函式庫包含許多從內建controller延伸功能的 controller
		 
		 ex:		
		  		
		  		    
		  		    PFQueryTableViewController 

##References
	 
- [Apple官方教學中文版](http://tommy60703.gitbooks.io/swift-language-traditional-chinese/content/index.html)（1.swift與objective-c的相異之處）
	- swift 的基礎語法還有 swift 語言的獨特之處
- Apple官方文件（1.swift與objective-c的相異之處）
	- [The Swift Programming Language](https://itunes.apple.com/tw/book/swift-programming-language/id881256329?l=zh&mt=11)
	 	- 詳細的swift語法教學
	
	- [Using Swift with Cocoa and Objective-c](https://itunes.apple.com/tw/book/using-swift-cocoa-objective/id888894773?	 		 	l=zh&mt=11)
	 	- 與上一本書相似，但本書的第一章節有許多objective-c和swift對照的短小範例，有助於objective-c開發者熟悉swift語法
	
- [Swift API 處理](http://leoyeh.me:8080/2014/11/30/Swift-API-處理-1/)（2.swift 使用JSON作為資料來源）
	 -  有一個簡短的範例程式，講述如何獲取JSON資料並加以利用
- [JSON排版網站](http://json.parser.online.fr)（2.swift 使用JSON作為資料來源）
	 - 許多開放資料網站的JSON檔所有資料都在同一行，非常不利於閱讀，這個網站可以將JSON資料排版成易於閱讀的格式
- [swift經緯度與地址雙向轉換](http://toyo0103.blogspot.tw/2015/03/swift-clgeocoder.html) （3.swift MapKit的應用）
	 - 地址轉經緯度
	 - 經緯度轉地址
	 - 如何利用轉型過後的資料與MapKit做各種應用
 - [cocoapods的環境安裝](http://code4app.com/article/cocoapods-install-usage)（4.swift Cocoapods環境安裝）
	 -  清楚講述安裝步驟，並解釋每個產生檔案的作用意義
- [parse與 swift的連接](http://blog.parse.com/announcements/building-apps-with-parse-and-swift/)（5. swift與parse之間的連結）
	 - 清楚講述如何將parse雲端資料庫和swift做連結並獲取相關資料
 - [parse.com](https://www.parse.com)	
	 - 可以手動建立資料庫也可以將JSON檔輸入自動產生資料庫
- [在swift專案中使用objective-c 的函式](http://myxcodepractice.blogspot.tw/2014/07/swiftobjective-c-swiftmix.html)
- [在objective-c 專案中寫 swift＆在swift 專案中寫 objective-c](http://tanjunqiang.com/index.php/archives/11)

		