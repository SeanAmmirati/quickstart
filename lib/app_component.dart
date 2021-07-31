import 'package:angular/angular.dart';

import 'src/hero.dart';
import 'src/hero_component.dart';

import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';
  List<Hero> heroes;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes();
  Hero selected;

  void onSelect(Hero hero) => selected = hero;

  final HeroService _heroService;
  AppComponent(this._heroService);
}
