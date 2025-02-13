#!/usr/bin/env sh
set -e
f=/admin/.env
if [ ! -f ${f} ];then
	echo "Not found .env file"
	exit 1
fi
curl ${VITE_PROJECT_API}
if [ $? -ne 0 ];then
	echo "API not available"
	exit 1
fi
sed -i "s@VITE_PROJECT_API=.*@VITE_PROJECT_API=${VITE_PROJECT_API}" ${f}
cat ${f}
cd /admin
npm run dev