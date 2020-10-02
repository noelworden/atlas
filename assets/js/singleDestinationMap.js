import { Feature, Map, View } from 'ol';
import Tile from 'ol/layer/Tile';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import OSM from 'ol/source/OSM';
import { Style, Icon } from 'ol/style';
import { Point } from 'ol/geom';
import { fromLonLat } from 'ol/proj'

let long = Destination.long
let lat = Destination.lat

let marker = new VectorLayer({
  source: new VectorSource({
    features: [new Feature({
      geometry: new Point(fromLonLat([long, lat])),
    })]
  }),
  style: new Style({
    image: new Icon({
      scale: [0.5, 0.5],
      src: Destination.source
    })
  })
});

export const map = new Map({
  target: 'map',
  layers: [
    new Tile({
      source: new OSM()
    }),
    marker
  ],
  view: new View({
    center: fromLonLat([long, lat]),
    zoom: 15
  })
});
