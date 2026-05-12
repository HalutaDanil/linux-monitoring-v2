<div align="center">

# Linux Monitoring v2.0

**[English](#english) | [Русский](#русский)**

</div>

---

<a name="english"></a>
## 🇬🇧 English

The next step in monitoring: from bash scripts to a full observability stack. The project covers file generation, log analysis, and real-time system monitoring with **Prometheus** and **Grafana**.

### What was done

| Task | What & Why |
|------|-----------|
| 01 | Built a file generator script with validation. Generates folders and files with specific naming patterns and sizes. Learned input validation and safe file operations. |
| 02 | Created a "cluttering" script that fills the filesystem until 1 GB remains. Simulates a disk-full scenario for testing monitoring alerts. |
| 03 | Wrote a cleanup script with 3 modes: by log file, by creation time range, and by name mask. Practical data lifecycle management. |
| 04 | Built an **nginx log generator** producing realistic combined-format logs with random IPs, response codes, methods, dates, and user agents. |
| 05 | Wrote an **awk-based log parser** with 4 modes: sort by code, unique IPs, error requests (4xx/5xx), and unique IPs among errors. |
| 06 | Used **GoAccess** for real-time web log analysis via a web interface. Compared custom parsing with a production-ready tool. |
| 07 | Installed and configured **Prometheus + Grafana**. Built a dashboard showing CPU, RAM, disk space, and disk I/O. Ran load tests with `stress`. |
| 08 | Imported the official **Node Exporter Quickstart** dashboard. Tested with `stress` and `iperf3` to observe CPU, memory, and network load. |
| 09 (Bonus) | Built a **custom node_exporter** in bash: collected CPU, RAM, and disk metrics, exposed them in Prometheus format via nginx, and configured Prometheus to scrape it. |

### Key takeaways
- Learned the full cycle: **generate load → collect metrics → visualize → alert**.
- Understood the difference between **log monitoring** (GoAccess) and **metric monitoring** (Prometheus/Grafana).
- Built a custom exporter to deeply understand how Prometheus scraping works under the hood.

### Tech Stack

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white) ![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white) ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white) ![nginx](https://img.shields.io/badge/nginx-009639?style=flat-square&logo=nginx&logoColor=white)

---

<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:58a6ff,50:1f6feb,100:0969da&height=2&section=header&text=&fontSize=1"/>
</div>

<a name="русский"></a>
## 🇷🇺 Русский

Следующий шаг в мониторинге: от bash-скриптов до полноценного стека наблюдаемости. Проект охватывает генерацию файлов, анализ логов и real-time мониторинг системы через **Prometheus** и **Grafana**.

### Что было сделано

| Задача | Что и зачем |
|--------|-------------|
| 01 | Скрипт-генератор файлов с валидацией входных параметров. Создаёт папки и файлы по заданным шаблонам имени и размера. Изучена валидация ввода и безопасные файловые операции. |
| 02 | Скрипт "замусоривания" файловой системы до оставшегося 1 ГБ. Симуляция переполнения диска для тестирования алертов мониторинга. |
| 03 | Скрипт очистки с 3 режимами: по лог-файлу, по диапазону времени создания и по маске имени. Практическое управление жизненным циклом данных. |
| 04 | **Генератор nginx-логов**, создающий реалистичные логи в combined-формате со случайными IP, кодами ответа, методами, датами и user-agent'ами. |
| 05 | **Парсер логов на awk** с 4 режимами: сортировка по коду, уникальные IP, ошибочные запросы (4xx/5xx), уникальные IP среди ошибок. |
| 06 | Использован **GoAccess** для real-time анализа веб-логов через веб-интерфейс. Сравнение кастомного парсинга с production-инструментом. |
| 07 | Установлены и настроены **Prometheus + Grafana**. Собран дашборд с CPU, RAM, свободным местом и дисковыми I/O. Проведены нагрузочные тесты через `stress`. |
| 08 | Импортирован готовый дашборд **Node Exporter Quickstart**. Тестирование через `stress` и `iperf3` для наблюдения за нагрузкой на CPU, память и сеть. |
| 09 (Бонус) | Написан **собственный node_exporter** на bash: сбор метрик CPU, RAM и диска, экспорт в формате Prometheus через nginx, настройка сбора метрик в Prometheus. |

### Ключевые выводы
- Изучен полный цикл: **генерация нагрузки → сбор метрик → визуализация → алерты**.
- Понята разница между **мониторингом логов** (GoAccess) и **метрик** (Prometheus/Grafana).
- Собственный exporter дал глубокое понимание, как работает scraping в Prometheus изнутри.

### Стек технологий

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white) ![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white) ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white) ![nginx](https://img.shields.io/badge/nginx-009639?style=flat-square&logo=nginx&logoColor=white)

---

<div align="center">

*Project from portfolio | Проект из портфолио*

</div>
