import 'package:mobx/mobx.dart';
import 'package:slidy_aula_1/app/shared/models/pokemon_model.dart';
import 'package:slidy_aula_1/app/shared/repository/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase(this.repository){
    pokemons = repository.getAllPokemons().asObservable();
  }
}