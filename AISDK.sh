#执行脚本
#！/bin/bash
#部署AI模型SDK包
cd src
mkdir build
cd build
rm -rf *
cmake ..
make
cd demo_image_inference
export LD_LIBRARY_PATH=../../lib

./easyedge_image_inference ../../../../../RES/ ../../../../../RES/ "$1"

#开启Http接口服务
cd ..
cd demo_serving
./easyedge_serving ../../../RES "$1" 0.0.0.0  24401
