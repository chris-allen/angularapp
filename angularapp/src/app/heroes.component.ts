import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Hero } from './hero';
import { HeroService } from './hero.service';

@Component({
    selector: 'my-heroes',
    styleUrls: ['./heroes.component.scss'],
    template: `
      <h2>My Heroes</h2>
      <ul class="heroes">
        <li *ngFor="let hero of heroes"
          [class.selected]="hero === selectedHero"
          (click)="onSelect(hero)">
          <span class="badge">{{hero.id}}</span> {{hero.name}}
        </li>
      </ul>
      <div *ngIf="selectedHero">
        <h2>
          {{selectedHero.name | uppercase}} is my hero
        </h2>
        <button (click)="gotoDetail()">View Details</button>
      </div>
    `
})
export class HeroesComponent implements OnInit {
  heroes: Hero[];
  selectedHero: Hero;

  constructor(
      private heroSerice: HeroService,
      private router: Router
  ) { }

  ngOnInit(): void {
      this.getHeroes();
  }

  getHeroes(): void {
      this.heroSerice.getHeroes().then(heroes => this.heroes = heroes);
  }

  onSelect(hero: Hero): void {
      this.selectedHero = hero;
  }

  gotoDetail(): void {
    this.router.navigate(['/detail', this.selectedHero.id]);
  }
}