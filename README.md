![Atividade](https://img.shields.io/badge/atividade-Flutter-blue)

# ✨ Dashboard Responsivo em Flutter
> Resolução de Atividade Prática – Análise e Desenvolvimento de Sistemas | 5ª Fase

**Aluna:** Eloize Aiume de Liz Pereira | **Turma:** 5ª Fase — Análise e Desenvolvimento de Sistemas (2026/1)

Repositório criado para armazenar a **atividade prática da Aula 6** em **Flutter**, focada na criação de interfaces adaptativas, desenvolvida no contexto da Faculdade Senac Joinville.

## 📚 Sobre o Projeto

Este projeto consiste em um dashboard responsivo que reorganiza automaticamente seus elementos com base na largura da tela disponível. O objetivo principal foi aplicar conceitos avançados de layout no Flutter para garantir uma experiência otimizada em dispositivos Mobile, Tablets e Desktops.

Foram aplicados e explorados os seguintes conceitos técnicos:

- 📏 **Layouts Responsivos**: Uso avançado de `LayoutBuilder` e `MediaQuery` para monitorar restrições de largura e a orientação do dispositivo (Retrato/Paisagem).
- 📱 **Breakpoints Inteligentes**: 
  - **Mobile (< 600px)**: Cards empilhados verticalmente (`Column`).
  - **Tablet (600px - 900px)**: Grid responsivo exibindo 2 cards por linha (`Wrap`).
  - **Desktop (> 900px)**: Cards distribuídos lado a lado ocupando o espaço total (`Row` com `Expanded`).
- 🧩 **Componentização**: Criação do widget customizado `DashboardCard`, garantindo um código limpo e reutilizável.
- 🎨 **Widgets Avançados**: Montagem de um gráfico de barras construído inteiramente do zero utilizando `Stack` e `Positioned`.
- 🎁 **Implementações Bônus**: 
  - Animações suaves na transição entre os layouts com `AnimatedSwitcher`.
  - Inclusão de um menu lateral (`Drawer`).
  - Adaptação do título baseada na orientação da tela.

## 📂 Componentes do Código

O projeto foi centralizado no ficheiro `Dashboard.dart`, organizado nas seguintes estruturas:

| 🧩 Classe / Widget        | 🧠 Responsabilidade                                                                                                                                           |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `MeuDashboardApp`         | Raiz da aplicação, responsável por injetar o `ThemeData` global (cores, tipografia) e iniciar a tela principal.                                               |
| `DashboardHome`           | Tela principal (`Scaffold`) que gerencia o `AppBar`, o `Drawer` e utiliza o `LayoutBuilder` para definir a renderização dos elementos com base nos breakpoints.|
| `DashboardCard`           | Componente `StatelessWidget` reutilizável responsável por exibir a interface visual padronizada (ícone, título, valor, cores, sombras e bordas).              |
| `GraficoSimplesStack`     | Widget criado como bônus, que simula um gráfico de desempenho utilizando `Stack` para as linhas de fundo e `Positioned` para posicionar as colunas.           |

## 📸 Screenshots

*(Substitua os links abaixo pelas imagens do seu projeto)*

### 📱 Mobile (< 600px)
![Mobile](https://i.postimg.cc/cLrDXfPw/Mobile.png)

### 💊 Tablet (600px - 900px)
![Tablet](https://i.postimg.cc/y8kfv029/Tablet.png)

### 💻 Desktop (> 900px)
![Desktop](https://i.postimg.cc/L8nyNjGk/Desktop.png)

## 🛠️ Tecnologias Utilizadas

- **Flutter**
- **Dart**

## 🚀 Como Executar

1. Clone o repositório para sua máquina local.
2. Certifique-se de ter o Flutter instalado e configurado corretamente.
3. Abra o terminal na pasta do projeto e instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o aplicativo:
   ```bash
   flutter run
   ```
5. Dica: Redimensione a janela do aplicativo (se estiver no Desktop ou Web) para ver a interface e as animações reagindo aos breakpoints em tempo real!
