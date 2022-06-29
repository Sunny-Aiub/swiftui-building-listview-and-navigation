

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData : ModelData
    @State private var showFavouritesOnly = false
    
    var filteredLandmarks : [Landmark]{
        modelData.landmarks.filter { landmark in
            
            (!showFavouritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                Toggle(isOn: $showFavouritesOnly) {
                    
                    Text("Favorites only")
                    
                }
                
                
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink {
                        
                        LandmarkDetail(landmark: landmark)
                        
                    } label: {
                        
                        LandmarkRow(landmark: landmark)
                        
                    }
                    
                }
                
            }
            //            List(landmarks) { landmark in
            //                NavigationLink {
            //                    LandmarkDetail(landmark: landmark)
            //                } label: {
            //                    LandmarkRow(landmark: landmark)
            //                }
            //
            //            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
    }
}
