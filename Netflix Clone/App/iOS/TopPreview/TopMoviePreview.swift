//
//  TopMoviePreviqw.swift
//  Netflix Clone
//
//  Created by Francesco Paolo Dellaquila on 02/12/20.
//

import SwiftUI
import struct Kingfisher.KFImage


struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool{
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat){
            if index + 1 != catCount{
                return false
            }
        }
        
        return true
    }
    
    var body: some View {
        ZStack{
            KFImage(movie.thumnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack{
                Spacer()
                
                HStack{
                    ForEach(movie.categories, id: \.self){ category in
                        
                        HStack{
                            Text(category)
                            
                            if !isCategoryLast(category){
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }

                        
                    }
                }
                Text("Row of buttons")
            }
        }.foregroundColor(.white)
    }
}

struct TopMoviePreviqw_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
