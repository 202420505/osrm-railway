FROM osrm/osrm-backend

# OSM 데이터를 컨테이너 내부로 복사 (or 외부 URL에서 다운로드)
ADD <your-osm-file>.osm.pbf /data/<your-osm-file>.osm.pbf

# OSM 데이터 전처리 (추출)
RUN osrm-extract -p /opt/car.lua /data/south-korea-latest.osm.pbf

# 데이터 컨트랙트 처리
RUN osrm-contract /data/<your-osm-file>.osrm

# OSRM 서버 실행
CMD ["osrm-routed", "/data/<your-osm-file>.osrm"]
