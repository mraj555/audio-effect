# AUDIO EFFECT

Audio Effecr package lets you add a beautiful Rotating Thumbnail Of Audio to your Flutter app.

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):

```yaml
dependencies:
  audio_effects: ^1.0.0+1
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:audio_effect/audio_effects.dart';
```

## Example

There are a number of properties that you can modify:

- height
- width
- color
- artworkBorder
- artworkWidth
- artworkHeight
- Audio id
- ArtWorkType

<hr>

<table>
<tr>
<td>

```dart
class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const AudioEffects(
          height: 200,
          width: 200,
          color: Colors.black,
          artworkWidth: 150,
          artworkHeight: 150,
          artworkBorder: BorderRadius.circular(radius),
          padding: EdgeInsects.all(size),
          isLocal: false,
          isPlaying: true,
          url: "Network URL Or File Path",
          type: ArtworkType.AUDIO,
          id: "Audio ID",
        ),
      ),
    );
  }
}
```

</td>
<td>
<video  src="https://user-images.githubusercontent.com/95268111/157144460-709998e7-08fa-4c41-974d-8880d1db9058.mp4"/>
</td>
</tr>
</table>

## Next Goals

- [x] Add Wave Effect Around Circle.

- [ ] Add more Effects to the package.