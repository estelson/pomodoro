import 'package:mobx/mobx.dart';

part "pomodoro.store.g.dart";

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo {
  trabalho,
  descanso,
}

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.descanso;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void reiniciar() {
    iniciado = false;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.trabalho;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.descanso;
  }
}
