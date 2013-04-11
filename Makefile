CC=g++
PCL=/yanlin/PCL

#eigen
LIBS += `pkg-config --libs eigen3`
CPPFLAGS += `pkg-config --cflags eigen3`
#boost
LIBS += -lboost_thread
CPPFLAGS += -lboost
#vtk
LIBS += -lvtkCommon -lvtksys -lvtkRendering -lvtkFiltering
CPPFLAGS += -lvtk-5.8 -I/usr/include/vtk-5.8
#pcl
LIBS += -L$(PCL)/lib -lpcl_common -lpcl_io
LIBS += -lpcl_features -lpcl_keypoints -lpcl_filters
LIBS += -lpcl_segmentation -lpcl_search -lpcl_sample_consensus
LIBS += -lpcl_visualization -lpcl_search -lpcl_kdtree -lpcl_octree
CPPFLAGS += -I$(PCL)/include/pcl-1.5

TARGET = 

all: $(TARGET)

$(TARGET).o: $(TARGET).cpp

$(TARGET): $(TARGET).o
	$(CC)  $+ $(LIBS) -o $(TARGET)

clean:
	rm -rf *.o

