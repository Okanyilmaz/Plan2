import SwiftUI

import FBSDKLoginKit

import Firebase



struct HomeView : View {
    
    
    
    @State var showHomeView = true
    
    
    
    var categories:[String:[Drink]] {
        
        .init(
            
            grouping: drinkData,
            
            by:{$0.category.rawValue}
            
        )
        
    }
    
    
    
    
    
    var body: some View {
        
        NavigationView {
           
            
            if showHomeView{
              
                login().frame(width: 100, height: 50)
                
             
            }
             
            else{
               
                List (categories.keys.sorted(), id: \String.self) {key in
                    
                    DrinkRow(categoryName: "\(key) ".uppercased(), drinks: self.categories[key]!)
                        
                        .frame(height: 300)
                        
                        .padding(.top)
                        
                        .padding(.bottom)
                }
                .navigationBarTitle(Text("PLANS"))
              
            }
   
        }
        
    }
    
}


#if DEBUG

struct HomeView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        
        
        HomeView()
        
    }
    
    
}



struct login : UIViewRepresentable{
    

    
    func makeCoordinator() -> login.Coordinator {
        
        
        
        return login.Coordinator()
        
  
    }
    

    func makeUIView(context: UIViewRepresentableContext<login>) -> FBLoginButton{
        
        
        
        let button = FBLoginButton()
        
        button.permissions = ["email"]
        
        button.delegate = context.coordinator
        
        return button
        
    }
    

    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<login>) {
        
        
        
    }

    
    class Coordinator : NSObject,LoginButtonDelegate{
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
 
            if error != nil{
                
  
                print((error?.localizedDescription)!)

            }
            

            if AccessToken.current != nil {
      
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
   
                Auth.auth().signIn(with: credential) { (res,er) in
      
                    if er != nil{
                         
                        print((er?.localizedDescription)!)
                        
 
                    }
                    
                    
                    print("sucessss")
                    
   
                }
                
               
  
            }
 
        }

        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            

            try! Auth.auth().signOut()
    
        }
  
    }

}


#endif
