
## darknet_base :
# should validate this is v1 model, as the conversion works well only for darknet v1 models
# python create_yolo_prototxt.py ../darknet/cfg/darknet.cfg darknet.prototxt
# python create_yolo_caffemodel.py -m darknet.prototxt -w ../darknet/weights/darknet.weights -o darknet.caffemodel

## converting darknet19 model :
# Obtain the path of this script
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

# clone SqueezeNet repository if needed
darknet_dir="$SCRIPTPATH/../darknet"
if [ ! -d "$darknet_dir" ]; then
  git clone https://github.com/pjreddie/darknet "$darknet_dir"
fi

# darknet v2 model, so the conversion doesnt promised to be ok
cd models-import
wget http://pjreddie.com/media/files/darknet19.weights
cd ..

python create_yolo_prototxt.py ../darknet/cfg/darknet19.cfg darknet19.prototxt
python create_yolo_caffemodel.py -m darknet19.prototxt -w ../darknet/weights/darknet19.weights -o darknet19.caffemodel