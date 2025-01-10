# My Linux Dotfiles 

This repository houses my personal dotfiles, meticulously curated for a streamlined and visually appealing Linux environment, with a strong emphasis on OLED-friendly aesthetics.

## Key Features

* **Shell:** Nushell (Nu) 
    * A swift and user-friendly shell that excels at data manipulation through intuitive pipelines, elevating the command-line experience.
    * **Configuration:** Located at `~/.config/nushell/config.nu`. 
        * **Key customizations:** 
            * **Dark Theme:** Prioritizes dark colors for OLED preservation.
            * **Color Adjustments:** Optimizes color schemes for better readability and reduced eye strain.
* **Prompt:** Starship 
    * A highly customizable and visually pleasing prompt that elegantly presents essential system information, enhancing both productivity and aesthetics while remaining mindful of OLED screen burn-in.
    * **Configuration:** 
        * **Key customizations:** 
            * **Dark Theme:** Utilizes dark colors and reduced brightness for OLED preservation.
            * **Informative Display:** Presents essential information with clear and concise formatting.
* **Terminal:** Wezterm 
    * A cutting-edge and performant terminal emulator boasting advanced features such as GPU acceleration, versatile tab and pane management, and a deeply customizable user interface, all optimized for OLED displays. 
    * **Configuration:** Located at `~/.wezterm.lua`
        * **Key customizations:**
            * **Dark Theme:** The `VisiBlue (terminal.sexy)` color scheme prioritizes dark colors for OLED optimization. 
            * **Reduced Opacity:** The `window_background_opacity` is set to 0.85 for slightly reduced opacity, further enhancing OLED compatibility.
            * **Dim Inactive Panes:** Inactive panes are dimmed to minimize OLED burn-in.

## Customization

* **Nushell:** Tailor your Nu environment by modifying the `.config/nushell` directory. 
* **Starship:** Fine-tune the Starship prompt configuration within `.config/starship/config.toml`.
* **Wezterm:** Modify the Wezterm configuration in `~/.wezterm.lua` to adjust color schemes, opacity, and inactive pane dimming for OLED optimization.

## Disclaimer

These dotfiles are provided "as is" without any warranty. Use them at your own discretion.

## Note

This configuration is specifically designed for users with OLED displays.
