setProgress = (element, percent) => {
    const Circumference = element.prop('r').baseVal.value * 2 * Math.PI;
    const Offset = Circumference - percent / 100 * Circumference;

    element.css({
        strokeDasharray: `${Circumference} ${Circumference}`,
        strokeDashoffset: Offset
    });
}

onload = () => {
    addEventListener('message', (event) => {
        switch (event.data.action) {
            case 'update': // update status
                $.each(event.data.data, (key, value) => {
                    const K = $(`#${key} circle`);
                    if (K.length) {
                        setProgress(K, value);
                    }
                });
                break;
            case 'status': // toggle panel visibility
                $('#status').toggle(500);
                break;
            case 'proximity': // update proximity
                setProgress($('#voice circle'), event.data.data);
                break;
            case 'talking': // talking/not talking
                $('#voice circle').css('stroke', event.data.data ? '#ff0000' : '#f7f7f7');
                $('#voice image').attr('href', event.data.data ? 'images/online-active.png' : 'images/online.png');
                break;
            case 'inCar': // event.data.data -> is player in vehicle
                $('#status').css('justify-content', event.data.data ? 'center' : 'flex-start');
                break;
        }

        $('#health circle').css('stroke', '#ff0000');
        $('#armor circle').css('stroke', '#8a8a8a');
        $('#hunger circle').css('stroke', '#c9b200');
        $('#thirst circle').css('stroke', '#0095ff');
        // $('#voice circle').css('stroke', '#3c3c3d');
        $('#drunk circle').css('stroke', '#e309b4');
    });
}

// // retrieve colors
// {
//     const Colors = JSON.parse(localStorage.getItem('hud_colors'));

//     if (Colors) { // we have something saved
//         $.each(Colors, (key, value) => {
//             $(`#${key} circle`).css('stroke', value);
//         });
//     }
// }

// picker
let colorPicker = new iro.ColorPicker('#picker', {
    borderWidth: 1,
    borderColor: '#7B68EE',
    layoutDirection: "horizontal",
    layout: [
        {
            component: iro.ui.Box,
        },
        {
            component: iro.ui.Slider,
            options: {
                sliderType: 'hue'
            }
        }
    ]
});