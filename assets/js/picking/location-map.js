import L from "leaflet";

export default class LocationMap {
    constructor(mapDomElement, mainLocation, markerClickedCallback) {
        this.map = L.map(mapDomElement).setView(mainLocation, 13);
        const accessToken = "pk.eyJ1IjoiZ3V1aG9saSIsImEiOiJja2c5bWVuaGwwc281MnNwZ3RtMjVlaWFuIn0.c8uUwyoB-wHJnrPEotEGSw"

        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
            attribution: '&copy; <a href="https://elxpro.com">Elxpro</a>',
            maxZoom: 18,
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1,
            accessToken: accessToken
        }).addTo(this.map);
        this.markerClickedCallback = markerClickedCallback;
    }

    addMarker(store) {
        console.log("addMarker")
        console.log(store)
        const marker = L.marker([store.lat, store.lng], {
                storeId: store.id
            }).addTo(this.map)
            .bindPopup(
                `
                <a href="/">
                <p>${store.name}</p>
                Quantidade de Produtos: ${store.total_products}
                </a>
                `
            );

        marker.on("click", e => {
            marker.openPopup();
            this.markerClickedCallback(e)
        })

        return marker;
    }
}