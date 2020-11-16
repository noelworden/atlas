import Feature from 'ol/Feature';
import Map from 'ol/Map';
import Point from 'ol/geom/Point';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import View from 'ol/View';
import {
  Fill,
  Stroke,
  Style,
  Text
} from 'ol/style';
import Tile from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj'
import CircleStyle from 'ol/style/Circle';

const stroke = new Stroke({
  color: 'black',
  width: 2
});

const fill = new Fill({
  color: 'red'
});

const coordinates = Destination.coordinates
const coordinatesCount = coordinates.length;
const features = new Array(coordinatesCount);

for (let i = 0; i < coordinatesCount; ++i) {
  features[i] = new Feature(new Point(fromLonLat(coordinates[i])));
  features[i].setStyle([
      new Style({
        image: new CircleStyle({
          fill: fill,
          stroke: stroke,
          radius: 7,
        }),
      }),

      new Style({
        text: new Text({
          text: Destination.names[i][0],
          offsetY: -15,
        })
      })
    ]
  );
}

const source = new VectorSource({
  features: features,
});

const vectorLayer = new VectorLayer({
  source: source,
});

export const map = new Map({
  layers: [
    new Tile({
      source: new OSM()
    }),
    vectorLayer
  ],
  target: 'map',
  view: new View({
    center: fromLonLat([Destination.median_long, Destination.median_lat]),
    zoom: 8,
  }),
});

