import 'package:flame/components.dart';
import 'package:flame/src/effects/controllers/effect_controller.dart';
import 'package:flame/src/effects/effect.dart';
import 'package:flame/src/effects/effect_target.dart';
import 'package:flame/src/effects/measurable_effect.dart';
import 'package:flame/src/effects/move_by_effect.dart';
import 'package:flame/src/effects/move_to_effect.dart';
import 'package:flame/src/effects/provider_interfaces.dart';

/// Base class for effects that affect the `position` of their targets.
///
/// The main purpose of this class is for reflection, for example to select
/// all effects on the target that are of "move" type.
///
/// Factory constructors [MoveEffect.by] and [MoveEffect.to] are also provided,
/// but they may be deprecated in the future.
abstract class MoveEffect extends Effect
    with EffectTarget<PositionProvider>
    implements MeasurableEffect {
  MoveEffect(
    super.controller,
    PositionProvider? target, {
    super.onComplete,
    super.key,
  }) {
    this.target = target;
  }

  factory MoveEffect.by(
    Vector2 offset,
    EffectController controller, {
    PositionProvider? target,
    void Function()? onComplete,
    ComponentKey? key,
  }) =>
      MoveByEffect(
        offset,
        controller,
        target: target,
        onComplete: onComplete,
        key: key,
      );

  factory MoveEffect.to(
    Vector2 destination,
    EffectController controller, {
    PositionProvider? target,
    void Function()? onComplete,
    ComponentKey? key,
  }) =>
      MoveToEffect(
        destination,
        controller,
        target: target,
        onComplete: onComplete,
        key: key,
      );
}
