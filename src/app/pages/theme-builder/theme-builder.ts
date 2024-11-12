import {ChangeDetectionStrategy, Component} from '@angular/core';
import {MatButtonModule} from '@angular/material/button';
import {MatInputModule} from '@angular/material/input';

@Component({
  selector: 'app-theme-builder',
  templateUrl: './theme-builder.html',
  styleUrls: ['./theme-builder.scss'],
  imports: [MatButtonModule, MatInputModule],
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class ThemeBuilder {
}
