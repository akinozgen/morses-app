//
//  StoryNavigation.swift
//  Test 3
//
//  Created by Akın Özgen on 30.10.2020.
//

import SwiftUI

struct StoryNavigation: View {
    
    @State var index = 0
    @State var stories = [
          Story(id: 0, image: "SR_intro", offset: 0,title: "Jack the Persian and the Black Castel"),
          Story(id: 1, image: "SR_intro", offset: 0,title: "The Dreaming Moon"),
          Story(id: 2, image: "SR_intro", offset: 0,title: "Fallen In Love"),
          Story(id: 3, image: "SR_intro", offset: 0,title: "Hounted Ground"),
    ]
    @State var scrolled = 0
    @State var index1 = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ZStack {
                    
                    // Zstack Will Overlap Views So Last WIll Become First...
                    
                    ForEach(stories.reversed()){story in
                        
                        HStack{
                            
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                                
                                Image(story.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                
                            }
                        }
                        .contentShape(Rectangle())
                        .offset(x: story.offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation{
                                
                                // disabling drag for last card...
                                
                                if value.translation.width < 0 && story.id != stories.last!.id{
                                    
                                    stories[story.id].offset = value.translation.width
                                }
                                else{
                                    
                                    // restoring cards...
                                    
                                    if story.id > 0{
                                        
                                        stories[story.id - 1].offset = 0
                                    }
                                }
                                
                                
                            }
                            
                        }).onEnded({ (value) in
                            
                            withAnimation{
                            
                                if value.translation.width < 0{
                                    
                                    if -value.translation.width > 180 && story.id != stories.last!.id{
                                        
                                        // moving view away...
                                        
                                        stories[story.id].offset = (value.translation.width)
                                        scrolled += 1
                                    }
                                    else{
                                        
                                        stories[story.id].offset = 0
                                    }
                                }
                                else{
                                    
                                    // restoring card...
                                    
                                    if story.id > 0{
                                        
                                        if value.translation.width > 180{
                                            
                                            stories[story.id - 1].offset = 0
                                            scrolled -= 1
                                        }
                                        else{
                                            
                                            stories[story.id - 1].offset = -(value.translation.width)
                                        }
                                    }
                                }
                            }
                            
                        }))
                    }
                }
                // max height...
                .frame(height: UIScreen.main.bounds.height - 40)
                .ignoresSafeArea(edges: .top)
                
            }
        }
    }

    func calculateWidth()->CGFloat{
              
              // horizontal padding 50
              
              let screen = UIScreen.main.bounds.width - 50
              
              // going to show first three cards
              // all other will be hidden....
              
              // scnd and third will be moved x axis with 30 value..
              
              let width = screen - (2 * 30)
              
              return width
          }
}

struct Story : Identifiable {
    var id : Int
    var image : String
    var offset : CGFloat
    var title : String
}

struct StoryNavigation_Previews: PreviewProvider {
    static var previews: some View {
        StoryNavigation()
    }
}
