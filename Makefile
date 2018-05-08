CC=g++

#eigen
LIBS += `pkg-config --libs eigen3`
CPPFLAGS += `pkg-config --cflags eigen3`
#boost
LIBS += -lboost_thread -lboost_system
CPPFLAGS += -lboost
#vtk
LIBS += -lvtkIOCore -lvtkIOExport -lvtkIOExport -lvtkCommonCore
LIBS += -lvtkCommonSystem -lvtkCommonMath -lvtkCommonMisc -lvtkCommonTransforms
LIBS += -lvtkCommonExecutionModel -lvtkCommonDataModel -lvtkIOPLY
LIBS += -lvtkFiltersModeling -lvtkFiltersCore -lvtkRenderingCore -lvtkViewsCore
LIBS += -lvtkFiltersSources -lvtkRenderingLOD
CPPFLAGS += -I/usr/include/vtk
#pcl
LIBS += -lpcl_common -lpcl_io
LIBS += -lpcl_features -lpcl_keypoints -lpcl_filters
LIBS += -lpcl_segmentation -lpcl_search -lpcl_sample_consensus
LIBS += -lpcl_visualization -lpcl_search -lpcl_kdtree -lpcl_octree
CPPFLAGS += -I/usr/include/pcl-1.8

TARGET = viewer

all: $(TARGET)

$(TARGET).o: $(TARGET).cpp

$(TARGET): $(TARGET).o
	$(CC)  $+ $(LIBS) -o $(TARGET)

clean:
	rm -rf *.o


